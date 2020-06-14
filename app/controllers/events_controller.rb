class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_search
  before_action :set_genre

  def index
    if params[:genre_id].blank?  #もしもジャンルを選択しなければ全てのイベントを表示
      @events = Event.all
      @name = "Event"
    else
      @events = Event.where(genre_id: params[:genre_id])
      @genre = Genre.find(params[:genre_id])
      @name = @genre.name
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      @event.email_sent = 0
      @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
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
      @genres = Genre.all
    end

    def event_params
      params.require(:event).permit(:title, :text, :value, :start_date, :end_date, :genre_id, :alarm)
    end
end
