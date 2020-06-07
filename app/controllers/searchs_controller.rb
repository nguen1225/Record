class SearchsController < ApplicationController
	def searchs
		@search = Event.search(params[:q])
		@events = @search.result
      	@genres = Genre.all
	end
end
