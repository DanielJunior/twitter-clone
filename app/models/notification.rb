class Notification < ApplicationRecord
  belongs_to :user
  after_create_commit :perform_notification

  scope :no_read_yet, -> {
    where(read: false)
  }

  scope :desc, -> {order(created_at: :desc)}

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
