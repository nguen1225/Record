class SearchsController < ApplicationController
	def searchs
		@search = Event.search(params[:q])
		@events = @search.result
      	@genres = Genre.where(user_id: current_user.id)
      	if @events != current_user.id
          redirect_to root_path(current_user)
    	end
	end
end
