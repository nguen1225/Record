class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
  	@genres = Genre.where(user_id: current_user.id)
  	@search = Event.ransack(params[:q])
  end
end
