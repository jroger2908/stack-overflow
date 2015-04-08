class Answer < ActiveRecord::Base
  validates: :title, presence: :true,
                      length: { maximum: 80}
  validates: :body, presence: :true

  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

end
