class UsersController < ApplicationController
  def index
  	@genres = Genre.all
  end
end
