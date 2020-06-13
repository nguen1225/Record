class GraphsController < ApplicationController
	before_action :set_search

  def index
  	@events = Event.all
  	@genres = Genre.all
  end

  private
    def set_search
      @search = Event.ransack(params[:q])
    end

    def event_params
      params.require(:event).permit(:title, :text, :value, :start_date, :end_date, :genre_id)
    end
end
