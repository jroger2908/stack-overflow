class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: :true

  validates :user, uniqueness: {scope: [:votable_id, :votable_type]}
  validate :is_not_own_votable?

  protected

  def is_not_own_votable?
    if self.votable.user == self.user
      errors.add(:user, "cannot vote on own response")
    end
  end
end
