class Users::SearchsController < ApplicationController
	before_action :authenticate_user!
	def searchs
		@search = current_user.events.search(params[:q])
		@events = @search.result.order(id: "DESC").page(params[:page]).per(10)
      	@genres_list = Genre.where(user_id: current_user.id)
	end
end
