class Answer < ActiveRecord::Base
  validates :body, presence: :true
  validates :user, presence: :true
  validates :question, presence: :true

  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

end
