class Users::GenresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_genre, only: [:edit, :update, :destroy]
  before_action :set_search
  before_action :set_genres

  def index
  	@genres = Genre.where(user_id: current_user.id).page(params[:page]).per(5)
  	@genre = Genre.new
    @search = Event.ransack(params[:q])
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.user_id = current_user.id

    if @genre.save
       #notice: 'Genre was successfully created.'
    else
      @genres = Genre.where(user_id: current_user.id)
    end
  end

  def edit
    if @genre.user_id != current_user.id
          redirect_to root_path(current_user)
    end
  end


  def update
    if @genre.update(genre_params)
      redirect_to genres_path, notice: 'Genre was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
      #notice: 'Genre was successfully destroyed.'
  end

  private
    def set_genre
      @genre = Genre.find(params[:id])
    end

    def set_search
      @search = Event.ransack(params[:q])
    end

    def set_genres
      @genres = Genre.where(user_id: current_user.id)
    end

    def genre_params
      params.require(:genre).permit(:name)
    end
end
