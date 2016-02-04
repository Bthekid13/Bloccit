class User < ActiveRecord::Base
<<<<<<< HEAD
<<<<<<< HEAD
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
=======
=======



>>>>>>> checkpoint-38
  before_save {self.email = email.downcase}

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates  :name, length: {minimum: 1, maximum: 100}, presence: true

  validates  :password, presence: true, length: {minimum: 6}, if: "password_digest.nil?"
  validates  :password, length: {minimum: 6}, allow_blank: true

  validates  :email,
              presence: true,
              uniqueness: {case_sensitive: false },
              length: {minimum: 3, maximum: 100},
              format: {with: EMAIL_REGEX}

has_secure_password
<<<<<<< HEAD
>>>>>>> checkpoint-36
=======

  def format_name
    if name
      name_a = []
      name.split.each do |name|
        name_a << name.capitalize
      end
      self.name = name_a.join(" ")
    end
  end
>>>>>>> checkpoint-38
end
