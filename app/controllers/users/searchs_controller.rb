class Users::SearchsController < ApplicationController
	def searchs
		@search = current_user.events.search(params[:q])
		@events = @search.result
      	@genres = Genre.where(user_id: current_user.id)
	end
end
