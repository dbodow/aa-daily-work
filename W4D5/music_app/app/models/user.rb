class User < ApplicationRecord
  attr_reader :password

  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: { message: "That username has been taken." }
  validates :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true, message: "Password must be at least 6 characters long." }

  after_initialize :ensure_session_token

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    real_password = BCrypt::Password.new(password_digest)
    real_password.is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest ||= BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save
    self.session_token
  end

  private

  def generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end
end
