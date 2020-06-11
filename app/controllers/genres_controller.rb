class GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update, :destroy]
  before_action :set_search
  before_action :set_genres

  def index
  	@genres = Genre.all
  	@genre = Genre.new
    @search = Event.ransack(params[:q])
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.user_id = current_user.id

    if @genre.save
      redirect_to genres_path, notice: 'Genre was successfully created.'
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
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
      redirect_to genres_url, notice: 'Genre was successfully destroyed.'
  end

  private
    def set_genre
      @genre = Genre.find(params[:id])
    end

    def set_search
      @search = Event.ransack(params[:q])
    end

    def set_genres
      @genres = Genre.all
    end

    def genre_params
      params.require(:genre).permit(:name)
    end
end
