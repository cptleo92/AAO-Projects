require 'bcrypt'

class User < ApplicationRecord
  validates :username, :password_hash, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  attr_reader :password

  has_many :todos
  has_many :steps, through: :todos, source: :steps
  
  def self.find_by_credentials(user_params)
    user = User.find_by(username: user_params[:username])
    return nil if user.nil? 
    return user.is_password?(user_params[:password]) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password) 
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_hash).is_password?(password)
  end

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end
end