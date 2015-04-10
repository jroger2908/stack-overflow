class Question < ActiveRecord::Base
  validates :title, presence: :true,
                      length: { maximum: 80}
  validates :body, presence: :true
  validates :user, presence: :true

  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
def vote_count
  	score = 0
    self.votes.each {|vote| score += vote.score }
    score
  end
end
