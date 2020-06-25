class Users::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_search
  before_action :set_genre

  def index
    @events = Event.where(user_id: current_user.id)
    #グラフ用
    if params[:genre_id].blank?
      @events = Event.where(user_id: current_user.id)
    else
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

      @event_months = []
      month = 0..12
      month.each do |i|
        events = Event.where(
          genre_id: params[:genre_id],
          start_date: DateTime.now.beginning_of_month..DateTime.now.end_of_month
        )
        @event_months << {
          name: events.take.genre_id,
          data: {
            value: events.sum(:value)
          }
        }
      end
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
      #                                 start_date: DateTime.now.beginning_of_month..DateTime.now.end_of_month
      #                                 )
      # @events_2month = Event.where(genre_id: params[:genre_id], start_date: DateTime.now.prev_month.beginning_of_month..DateTime.now.prev_month.end_of_month)
      # @events_3month = Event.where(genre_id: params[:genre_id], start_date: DateTime.now.ago(2.month).beginning_of_month..DateTime.now.ago(2.month).end_of_month)
      @genre = Genre.find(params[:genre_id])
    end
    #詳細用
    if params[:genre_id].blank?  #もしもジャンルを選択しなければ全てのイベントを表示
      @events_calender = Event.where(user_id: current_user.id).page(params[:page]).per(5)
      @name = "投稿一覧"
    else
      @events_calender = Event.where(genre_id: params[:genre_id]).page(params[:page]).per(5)
      @genre = Genre.find(params[:genre_id])
      @name = @genre.name
    end
  end

  def show
    if @event.user_id != current_user.id
          redirect_to root_path(current_user)
    end
  end

  def new
    @event = Event.new
  end

  def edit
    if @event.user_id != current_user.id
          redirect_to root_path(current_user)
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to @event, notice: '作成されました。'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: '更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def set_search
      @search = Event.ransack(params[:q])
    end

    def set_genre
      @genres_list = Genre.where(user_id: current_user.id)
    end

    def event_params
      params.require(:event).permit(:title, 
                                    :text, 
                                    :value, 
                                    :start_date, 
                                    :end_date, 
                                    :genre_id, 
                                    :alarm
                                    )
    end
end
