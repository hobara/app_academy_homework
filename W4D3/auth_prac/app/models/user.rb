class User < ApplicationRecord

  validates :username, :session_token, presence: true
  validates :password_digest, presence: { errors: ["Password can't be blank"] }
  validate :password, allow_nil: true

  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    if user.nil?
      return nil
    else
      user.is_password?(password) ? user : nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base(64)
  end



end
