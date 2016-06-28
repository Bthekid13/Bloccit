# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role            :integer
#  auth_token      :string
#

class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy


  before_save {self.email = email.downcase}
  before_save {self.role ||= :member}

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates  :name, length: {minimum: 1, maximum: 100}, presence: true
   before_save { self.email = email.downcase }
   before_save { self.role ||= :member }

   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

   validates :name, length: { minimum: 1, maximum: 100 }, presence: true

   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 100 },
             format: { with: EMAIL_REGEX }
   validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
   validates :password, length: { minimum: 6 }, allow_blank: true


   enum role: [:member, :admin]

def favorite_for(post)
  favorites.where(post_id: post.id).first
end

def avatar_url(size)
  gravatar_id = Digest::MD5::hexdigest(self.email).downcase
  "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
end

def generate_auth_token
  loop do
    self.auth_token = SecureRandom.base64(64)
    break unless User.find_by(auth_token: auth_token)
  end
end


private
  def format_name
    if name
      name_a = []
      name.split.each do |name|
        name_a << name.capitalize
      end
      self.name = name_a.join(" ")
    end
  end
end
