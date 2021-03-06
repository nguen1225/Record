class Users::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[show edit update destroy]
  before_action :set_search
  before_action :set_genre

  def index
    @events = Event.where(user_id: current_user.id)
    if params[:genre_id].blank? # もしもジャンルを選択しなければ全てのイベントを表示
      @events_calender = Event.where(user_id: current_user.id).page(params[:page]).per(5)
      @name = '投稿一覧'
    else
      @events_calender = Event.where(genre_id: params[:genre_id]).page(params[:page]).per(5)
      @genre = Genre.find(params[:genre_id])
      @name = @genre.name
    end
  end

  def show
    redirect_to root_path(current_user) if @event.user_id != current_user.id
  end

  def new
    @event = Event.new
  end

  def edit
    redirect_to root_path(current_user) if @event.user_id != current_user.id
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
    params.require(:event).permit(:title, :text, :value, :start_date, :end_date, :genre_id, :alarm)
  end
end
