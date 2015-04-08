class User < ActiveRecord::Base

  validates :name, presence: :true
  validates :username, presence: :true,
                        uniqueness: :true
  validates :password, presence: :true,
                        length: { minimum: 4 }

  has_many :questions
  has_many :answers
  has_many :commments
  has_many :votes

  has_secure_password
end
