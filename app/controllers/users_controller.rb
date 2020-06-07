class UsersController < ApplicationController
  def index
  	@genres = Genre.all
  	@search = Event.ransack(params[:q])
  end
end
