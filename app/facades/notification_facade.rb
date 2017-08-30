class NotificationFacade < DefaultFacade

  def initialize current_user
    super current_user
  end

  def title
    "Notifications"
  end

  def notifications
    current_user.notifications.desc
  end

  def relationship(notification)
    Relationship.where({follower_id: notification.relationship.follower_id, followed_id: notification.user.id}).first
  end
end