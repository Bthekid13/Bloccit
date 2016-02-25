class User < ActiveRecord::Base
  has_many :posts

  before_save { self.email &&= email.downcase }
  before_save { self.role ||= :member }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  enum role: [:member, :moderator, :admin]

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :role, inclusion: { in: roles.keys ,
            message: "%{value} is not a valid role" }

  has_secure_password


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
