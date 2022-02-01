class User < ApplicationRecord
  attr_reader :password

  validates :email, :password_hash, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password_hash, presence: { message: "Password can''t be blank" }
  validates :password, length: { minimum:6, allow_nil: true }
  after_initialize :ensure_session_token

  has_many :notes, dependent: :destroy

  def self.find_by_credentials(email, pw)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(pw) ? user : nil
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_hash).is_password?(password)
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
