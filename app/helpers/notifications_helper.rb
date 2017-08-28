module NotificationsHelper

  PANELS_COLORS = {
      "false": "panel-success",
      "true": "panel-info"
  }

  def color_for_notification notification
    PANELS_COLORS[notification.read.to_s.to_sym]
  end

end
