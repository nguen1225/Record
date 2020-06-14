class NotificationMailer < ApplicationMailer

	def self.notify_user
		beginning_of_tomorrow = Time.now.tomorrow.beginning_of_day
		end_of_tomorrow = Time.now.tomorrow.end_of_day
		#@user = User.where(email_sent: 0)
		@events = Event.where("start_date >= ? and start_date <= ? and email_sent= 0 and alarm: true", beginning_of_tomorrow, end_of_tomorrow)
		@events.each do |event|
			user = event.user
			email = user.email
			send_email(email).deliver_now
			event.update(email_sent: 1)
		end
	end

	def send_email(email)
		#@user = user
    	mail(subject: "予定前です。", to: email ) do |format|
      		format.text
    	end
	end
end
