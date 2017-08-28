class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification)
    ActionCable.server.broadcast "notifications_channel_#{notification.user.id}", message: notification.as_json
  end
end
