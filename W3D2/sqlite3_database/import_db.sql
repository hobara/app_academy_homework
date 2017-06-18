DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  q_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (q_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  q_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  p_id INTEGER,
  FOREIGN KEY (p_id) REFERENCES replies(id),
  FOREIGN KEY (q_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS questions_likes;
CREATE TABLE questions_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  q_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (q_id) REFERENCES questions(id)
);


INSERT INTO users(fname, lname)
VALUES ('Hiro', 'Obara');

INSERT INTO users(fname, lname)
VALUES ('Graham', 'Paye');

INSERT INTO questions(title, body, user_id)
VALUES ('How do I insert?', 'Seriously, I''ve forgotten', 2);

INSERT INTO replies(q_id, p_id, body, user_id)
VALUES (1, NULL, 'Insert into tablename', 1);

INSERT INTO replies(q_id, p_id, body, user_id)
VALUES (1, 1, 'Thanks, lol', 2);

INSERT INTO questions_likes(user_id, q_id)
VALUES (2, 1);

INSERT INTO question_follows(user_id, q_id)
VALUES (2, 1);

INSERT INTO questions_likes(user_id, q_id)
VALUES (1, 1);
