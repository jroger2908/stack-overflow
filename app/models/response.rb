class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, polymorphic: :true

  validates_uniqueness_of :user_id, :scope [:parent_id, :parent_type]
end
