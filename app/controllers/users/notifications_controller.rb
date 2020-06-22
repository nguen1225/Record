class Users::NotificationsController < ApplicationController


	def index
		@search = Event.ransack(params[:q])
		@genres_list = Genre.where(user_id: current_user.id)
		beginning_of_tomorrow = Time.now.tomorrow.beginning_of_day
		end_of_tomorrow = Time.now.tomorrow.end_of_day
	    @notifications = current_user.events.where("start_date >= ? and start_date <= ?  and alarm = ?", beginning_of_tomorrow, end_of_tomorrow, true)
	    #binding.pry
	    #通知画面を開くとcheckedをtrueにして通知確認済にする
		# @notifications.where(checked: false).each do |notification|
		#   notification.update_attributes(checked: true)
		# end
	end



	def destroy_all
      #通知を全削除
      	beginning_of_tomorrow = Time.now.tomorrow.beginning_of_day
		end_of_tomorrow = Time.now.tomorrow.end_of_day
      	@notifications = current_user.events.where("start_date >= ? and start_date <= ?  and alarm = ?", beginning_of_tomorrow, end_of_tomorrow, true)
        @notifications.destroy_all
        redirect_to notifications_path
    end
end
