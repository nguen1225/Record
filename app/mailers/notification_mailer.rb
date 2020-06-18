class NotificationMailer < ApplicationMailer

	#予定通知用
	def self.notify_user
		beginning_of_tomorrow = Time.now.tomorrow.beginning_of_day
		end_of_tomorrow = Time.now.tomorrow.end_of_day
		#@user = User.where(email_sent: 0)
		@events = Event.where("start_date >= ? and start_date <= ? and email_sent= 0 and alarm = ?", beginning_of_tomorrow, end_of_tomorrow, true)
		@events.each do |event|
			user = User.find(event.user_id)
			send_email(user.email, event.id).deliver_now
			event.update(email_sent: 1)
		end
	end

	#予定通知用
	def send_email(email, event_id)
		@event = Event.find(event_id)
    	 mail(subject: "予定前です。", to: email ) do |format|
       		format.text
    	 end
	end
end
