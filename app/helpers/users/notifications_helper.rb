module Users::NotificationsHelper
  def unchecked_notifications
    @notifications = current_user.events.notifications.where(checked: false)
  end
end
