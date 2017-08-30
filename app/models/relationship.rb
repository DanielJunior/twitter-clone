class Relationship < ApplicationRecord
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  has_one :notification, dependent: :destroy

  after_create_commit :generate_notification

  FOLLOWERS = 1
  FOLLOWING = 2

  ACCEPT = 1
  REJECT = 2

  def generate_notification
    follower = User.find(self.follower_id)
    notification = Notification.new(relationship: self, read: false, message: "#{follower.name} wants to follows you!")
    notification.save
  end

  def accept
    self.update_attributes(accepted: !self.accepted)
  end

  def reject
    self.destroy
  end

  def perform_action action
    action == ACCEPT ? accept : reject
  end

end
