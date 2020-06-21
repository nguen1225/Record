class Notification < ApplicationRecord

	belongs_to :user, optional: true
	belongs_to :event, optional: true

	default_scope->{order(created_at: :desc)}


 #    def self.notification_create
 #    	beginning_of_tomorrow = Time.now.tomorrow.beginning_of_day
	# 	end_of_tomorrow = Time.now.tomorrow.end_of_day
	# 	@events = Event.where("start_date >= ? and start_date <= ? and email_sent= 0 and alarm = ?", beginning_of_tomorrow, end_of_tomorrow, true)
	# 		@events.each do |event|
	# 			#notificationにイベントを通知として追加する。
	# 			user = User.find(event.user_id)
	# 			event.update(email_sent: 1)
	# 		end
	# end
end
