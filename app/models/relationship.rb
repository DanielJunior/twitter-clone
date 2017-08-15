class Relationship < ApplicationRecord
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  validates_uniqueness_of [:followed_id, :follower_id]

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  FOLLOWERS = 1
  FOLLOWING = 2
end
