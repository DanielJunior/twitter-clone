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
end