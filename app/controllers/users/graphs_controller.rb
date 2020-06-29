class Users::GraphsController < ApplicationController
	before_action :authenticate_user!
	def index
		@search = current_user.events.search(params[:q])
      	@genres_list = Genre.where(user_id: current_user.id)
      	@genres_graph_list = Genre.where(user_id: current_user.id)
      							  .page(params[:page]).per(5)

      	if params[:genre_id].blank?
      		@events = Event.where(user_id: current_user.id)
    	else
    	  @genre = Genre.find(params[:genre_id])
      	  @name = @genre.name
	      event_months = Event.where(genre_id: params[:genre_id])
	      					  .where(start_date: DateTime.now.beginning_of_year..DateTime.now.end_of_year)
	      					  .group("DATE_FORMAT( `sstart_date`, '%Y-%m' )")  #strftime('%Y-%m', start_date) mysql不可メソット
	      					  .sum(:value)
	      @event_months = []
		      event_months.sort.each do |event_month|
		        @event_months << {
		           name: event_month[0],
		           data: {
		             value: event_month[1]
		           }
		        }
		      end

	      event_months = Event.where(genre_id: params[:genre_id])
	      					  .where(start_date: DateTime.now.beginning_of_month..DateTime.now.end_of_month)
	      					  .group(:title)
	      					  .sum(:value)
	      @event_now_month = []
		      event_months.sort.each do |event_month|
		        array = [event_month[0], event_month[1]]
		        @event_now_month.push(array)
		      end

	      event_months = Event.where(genre_id: params[:genre_id])
	      					  .where(start_date: DateTime.now.ago(1.month).beginning_of_month..DateTime.now.ago(1.month).end_of_month)
	      					  .group(:title)
	      					  .sum(:value)
	      @event_2month_ago = []
		      event_months.sort.each do |event_month|
		        array = [event_month[0], event_month[1]]
		        @event_2month_ago.push(array)
		      end

	      event_months = Event.where(genre_id: params[:genre_id])
	      					  .where(start_date: DateTime.now.ago(2.month).beginning_of_month..DateTime.now.ago(2.month).end_of_month)
	      					  .group(:title)
	      					  .sum(:value)
	      @event_3month_ago = []
		      event_months.sort.each do |event_month|
		        array = [event_month[0], event_month[1]]
		        @event_3month_ago.push(array)
		      end
		end
	end
end

# DATE_FORMAT( `sample_time`, '%Y-%m' )


	# @search = current_user.events.search(params[:q])
	# 	@genre = Genre.find(params[:genre_id])
 	#      	@genres_list = Genre.where(user_id: current_user.id)
 	#      	@genres_graph_list = Genre.where(user_id: current_user.id)
 	#     							  .page(params[:page]).per(5)

 	#      	if params[:genre_id].blank?
 	#      		@events = Event.where(user_id: current_user.id)
 	#    	else
	#       event_months = Event.where(genre_id: params[:genre_id])
	#  							.where(start_date: DateTime.now.beginning_of_year..DateTime.now.end_of_year)
	#   						.group("strftime('%Y-%m', start_date)")
	#  							.sum(:value)
	#       @event_months = []
	#       event_months.sort.each do |event_month|
	#         @event_months << {
	#            name: event_month[0],
	#            data: {
	#              value: event_month[1]
	#            }
	#         }
	#       end

	#       event_months = Event.where(genre_id: params[:genre_id])
	#  							.where(start_date: DateTime.now.beginning_of_month..DateTime.now.end_of_month)
	#    						.group(:title)
	#    						.sum(:value)
	#       @event_now_month = []
	#       event_months.sort.each do |event_month|
	#         array = [event_month[0], event_month[1]]
	#         @event_now_month.push(array)
	#       end
	# 	end
	# end

	      # @event_months = []
	      # month = 0..12
	      # month.each do |i|
	      #   # datetime = DateTime('2020-6-01') - i
	      #   events = Event.where(
	      #     genre_id: params[:genre_id],
	      #     #start_date: datetime.beginning_of_month..datetime.end_of_month
	      #     start_date: DateTime.now.beginning_of_month..DateTime.now.end_of_month
	      #   )
	      #   @event_months << {
	      #     name: events.take.start_date,
	      #     data: {
	      #       value: events.sum(:value)
	      #     }
	      #   }
	      # end

	      # @event_months = []
	      # # month = 0..12
	      # (Date.parse('01-01')..Date.parse('12-31')).each do |i|
	      #   events = Event.where(
	      #     genre_id: params[:genre_id],
	      #     start_date: DateTime.now.beginning_of_month..DateTime.now.end_of_month
	      #   )
	      #   @event_months << {
	      #     name: events.take.start_date.strftime('%Y/%m'),
	      #     data: {
	      #       value: events.sum(:value)
	      #     }
	      #   }
	      #   #binding.pry
	      # end

	      # @event_months = []
	      # events = Event.where(
	      #   genre_id: params[:genre_id],
	      #   start_date: DateTime.now.beginning_of_month..DateTime.now.end_of_month
	      # )
	      # @event_months << {
	      #   name: events.take.start_date,
	      #   data: {
	      #     value: events.sum(:value)
	      #   }
	      # }

	      # @events_1month = Event.where(genre_id: params[:genre_id], 
	      #                            start_date: DateTime.now.beginning_of_month..DateTime.now.end_of_month
	      #                                 )
	      # @events_2month = Event.where(genre_id: params[:genre_id], 
	      #   						   start_date: DateTime.now.prev_month.beginning_of_month..DateTime.now.prev_month.end_of_month)
	      # @events_3month = Event.where(genre_id: params[:genre_id], 
	      #   						   start_date: DateTime.now.ago(2.month).beginning_of_month..DateTime.now.ago(2.month).end_of_month)
