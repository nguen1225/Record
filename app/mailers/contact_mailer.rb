class ContactMailer < ApplicationMailer

	#お問い合わせ用
	def send_admin_reply(user, contact)
	  @user = user
	  @answer = contact.reply
	  mail to: user.email, subject: '【Record】 お問い合わせありがとうございます'
	end

end