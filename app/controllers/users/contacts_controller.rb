class Users::ContactsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_search
  	before_action :set_genre

	def new
	  @contact = Contact.new
	end

	def create
	  @contact = Contact.new(contact_params)
	  @contact.user_id = current_user.id
	  if @contact.save
		redirect_to contacts_complete_path
	  else
		render :new
	  end
	end

	def complete
	end

	private

	def set_search
      	  @search = Event.ransack(params[:q])
    	end

    	def set_genre
      	  @genres_list = Genre.where(user_id: current_user.id)
    	end

	def contact_params
	  params.require(:contact).permit(:email, :message, :reply)
	end
end
