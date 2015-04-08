class Question < ActiveRecord::Base
  validates :title, presence: :true,
                      length: { maximum: 80}
  validates :body, presence: :true

  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

end
