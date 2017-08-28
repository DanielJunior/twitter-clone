class Notification < ApplicationRecord
  belongs_to :user
  after_create_commit :perform_notification

  scope :no_read_yet, -> {
    where(read: false)
  }

  scope :desc, -> {order(created_at: :desc)}

  def perform_notification
    post_notification_job
  end

  def post_notification_job
    NotificationBroadcastJob.perform_later self
  end

  def toggle_active!
    update read: !read
  end
end
