class NotificationsController < ApplicationController

  def index
    @facade = NotificationFacade.new current_user
  end

  def update
    notification = Notification.find(params[:id])
    notification.toggle_active!
    redirect_to notifications_path
  end

  def destroy
    Notification.delete(params[:id])
    redirect_to notifications_path
  end
end
