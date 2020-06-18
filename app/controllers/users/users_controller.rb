class Users::UsersController < ApplicationController
	before_action :authenticate_user!
  def index
  	@genres_list = Genre.where(user_id: current_user.id)
  	@search = Event.ransack(params[:q])
  end
end
