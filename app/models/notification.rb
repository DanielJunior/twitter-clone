class Notification < ApplicationRecord
  belongs_to :relationship

  after_create_commit :perform_notification

  scope :no_read, -> {where(read: false)}

  scope :desc, -> {order(created_at: :desc)}

  scope :by_user, ->(user) {
    joins(:relationship).where(relationships: {followed: user.id})
  }

  def user
    self.relationship.followed
  end

  def perform_notification
    post_notification_job
    post_notification_email
  end

  def post_notification_job
    NotificationBroadcastJob.perform_later self
  end

  def post_notification_email
    UserMailer.follow_notification(self.user).deliver_later
  end

  def toggle_active!
    update read: !read
  end
end
