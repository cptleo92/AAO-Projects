class User < ApplicationRecord

  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :password_hash, presence: { message: 'cannot be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  has_many :posts, 
    foreign_key: :author_id,
    dependent: :destroy

  has_many :subs,
    foreign_key: :moderator_id,
    dependent: :destroy

  def self.find_by_credentials(username, password)
    return nil if User.find_by(username: username).nil?
    user = User.find_by(username: username)
    user.is_password?(password) ? user : nil
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

  def posts_in_subs
    post_subs = PostSub.where(post_id: self.post_ids)    
    post_sub_pair = []
    post_subs.each do |post_sub|
      post = Post.find(post_sub.post_id)
      sub = Sub.find(post_sub.sub_id)
      post_sub_pair << [post, sub]
    end    
    post_sub_pair
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
