class Answer < ActiveRecord::Base
  validates :body, presence: :true
  validates :user, presence: :true
  validates :question, presence: :true

  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  def vote_count
  	score = 0
    self.votes.each {|vote| score += vote.score }
    score
  end

end
