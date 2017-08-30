class DefaultFacade

  attr_reader :current_user

  def initialize current_user
    @current_user = current_user
  end

  def no_read_notifications
    current_user.notifications.no_read
  end

end