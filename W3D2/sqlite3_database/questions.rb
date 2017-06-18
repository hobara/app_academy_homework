require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end

class Users
  attr_accessor :fname, :lname
  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.find_by_id(id)
    var = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM users
      WHERE id = ?
    SQL
    var.map { |v| Users.new(v) }
  end

  def self.find_by_name(fname, lname)
    var = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT *
      FROM users
      WHERE fname = ? AND lname = ?
    SQL
    var.map { |v| Users.new(v) }
  end

  def followed_questions
    QuestionFollows.followed_question_for_user_id(@id)
  end

  def authored_questions
    Questions.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def average_karma
    var = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT SUM(questions_likes.id) / COUNT(q_id) AS karma
      FROM questions
        JOIN questions_likes ON questions.id = q_id
        GROUP BY questions.user_id
        HAVING questions.user_id = ?
    SQL
    var[0]["karma"]
  end

  def save
    if @id
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO users(fname, lname)
      VALUES (?, ?)
      SQL
      QuestionsDatabase.last_insert_row_id = @id
    end
  end

end

class Questions
  attr_accessor :title, :body
  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def followers
    QuestionFollows.followers_for_question_id(@id)
  end

  def self.find_by_id(id)
    var = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM questions
      WHERE id = ?
    SQL
    var.map { |v| Questions.new(v) }
  end

  def self.find_by_author_id(author_id)
    var = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT *
      FROM questions
      WHERE user_id = ?
    SQL
    var.map { |v| Questions.new(v) }
  end

  def author
    self.class.find_by_author_id(@user_id)
  end

  def replies
    Reply.find_by_user_id(@user_id)
  end

  def likers
    QuestionLikes.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLikes.num_likes_for_question_id(@id)
  end

  def save
    if @id
      QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id, @id)
      UPDATE questions
      SET
        title = ?, body = ?, user_id = ?
      WHERE
        id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
      INSERT INTO questions(title, body, user_id)
      VALUES (?, ?, ?)
      SQL
      QuestionsDatabase.last_insert_row_id = @id
    end
  end

end

class QuestionFollows
  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @q_id = options['q_id']
  end

  def self.find_by_id(id)
    var = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM question_follows
      WHERE id = ?
    SQL
    var.map { |v| QuestionFollows.new(v) }
  end

  def self.most_followed_questions(n)
    var = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT *
      FROM questions
      WHERE
        id IN (
          SELECT p.q_id
          FROM (
            SELECT q_id, COUNT(user_id)
            FROM question_follows
            GROUP BY q_id
            ORDER BY COUNT(user_id) DESC
            ) as p
          LIMIT ?
        )
    SQL
    var.map { |v| Questions.new(v) }
  end

  def self.followers_for_question_id(question_id)
    var = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM users
      JOIN question_follows ON user_id = users.id
      WHERE q_id = ?
    SQL
    var.map { |v| Users.new(v) }
  end

  def self.followed_question_for_user_id(user_id)
    var = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM question_follows
      JOIN questions ON questions.id = q_id
      WHERE question_follows.user_id = ?
    SQL
    var.map { |v| Questions.new(v) }
  end

end

class Reply
  attr_accessor :body
  def initialize(options)
    @id = options['id']
    @q_id = options['q_id']
    @body = options['body']
    @p_id = options['p_id']
    @user_id = options['user_id']
  end

  def self.find_by_id(id)
    var = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM replies
      WHERE id = ?
    SQL
    var.map { |v| Reply.new(v) }
  end

  def self.find_by_user_id(user_id)
    var = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM replies
      WHERE user_id = ?
    SQL
    var.map { |v| Reply.new(v) }
  end

  def self.find_by_question_id(q_id)
    var = QuestionsDatabase.instance.execute(<<-SQL, q_id)
      SELECT *
      FROM replies
      WHERE q_id = ?
    SQL
    var.map { |v| Reply.new(v) }
  end

  def self.find_by_parent_id(p_id)
    var = QuestionsDatabase.instance.execute(<<-SQL, p_id)
      SELECT *
      FROM replies
      WHERE p_id = ?
    SQL
    var.map { |v| Reply.new(v) }
  end

  def self.find_by_child_replies(id)
    var = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM replies
      WHERE p_id = ?
    SQL
    var.map { |v| Reply.new(v) }
  end

  def author
    self.class.find_by_user_id(@user_id)
  end

  def question
    self.class.find_by_question_id(@q_id)
  end

  def parent_reply
    self.class.find_by_parent_id(@p_id)
  end

  def child_replies
    self.class.find_by_child_replies(@id)
  end

  def save
    if @id
      QuestionsDatabase.instance.execute(<<-SQL, @user_id, @p_id, @body, @q_id, @id)
      UPDATE replies
      SET
        user_id = ?, p_id = ?, body = ?, q_id = ?
      WHERE
        id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, @user_id, @p_id, @body, @q_id)
      INSERT INTO (user_id, p_id, body, q_id)
      VALUES (?, ?, ?, ?)
      SQL
      QuestionsDatabase.last_insert_row_id = @id
    end
  end

end

class QuestionLikes

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @q_id = options['q_id']
  end

  def self.likers_for_question_id(question_id)
    var = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM users
      WHERE
        id IN (
          SELECT user_id
          FROM questions
          WHERE id = ?
        )
    SQL
    var.map { |v| Users.new(v) }
  end

  def self.find_by_id(id)
    var = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM questions_likes
      WHERE id = ?
    SQL
    var.map { |v| QuestionLikes.new(v) }
  end

  def self.liked_questions_for_user_id(user_id)
    var = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM questions
      WHERE user_id IN (
        SELECT user_id
        FROM questions_likes
        WHERE user_id = ?
      )
    SQL
    var.map { |v| Questions.new(v) }
  end

  def self.num_likes_for_question_id(q_id)
    var = QuestionsDatabase.instance.execute(<<-SQL, q_id)
      SELECT COUNT(id)
      FROM questions_likes
      WHERE q_id = ?
    SQL
    var[0]["COUNT(id)"]
  end

end
