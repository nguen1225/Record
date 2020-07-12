class Users::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @search = Event.ransack(params[:q])
    @genres_list = Genre.where(user_id: current_user.id)
    beginning_of_tomorrow = Time.now.tomorrow.beginning_of_day
    end_of_tomorrow = Time.now.tomorrow.end_of_day
    @notifications = current_user.events.where('start_date >= ? and start_date <= ?  and alarm = ?',
                                               beginning_of_tomorrow, end_of_tomorrow, true)
  end

  def destroy_all
    beginning_of_tomorrow = Time.now.tomorrow.beginning_of_day
    end_of_tomorrow = Time.now.tomorrow.end_of_day
    @notifications = current_user.events.where('start_date >= ? and start_date <= ?  and alarm = ?',
                                               beginning_of_tomorrow, end_of_tomorrow, true)
    @notifications.destroy_all
    redirect_to notifications_path
  end
end
