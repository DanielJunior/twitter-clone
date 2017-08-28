class Relationship < ApplicationRecord
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  validates_uniqueness_of [:followed_id, :follower_id]
  after_create_commit :generate_notification

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  FOLLOWERS = 1
  FOLLOWING = 2

  def generate_notification
    follower = User.find(self.follower_id)
    notification = Notification.new(user_id: self.followed_id, read: false, message: "#{follower.name} wants to follows you!")
    notification.save
  end

end
