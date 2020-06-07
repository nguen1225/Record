class GenresController < ApplicationController
  def index
  	@genres = Genre.all
  	@genre = Genre.new
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

  

  def destroy
  	@genre = Genre.find(params[:id])
    @genre.destroy
      redirect_to genres_url, notice: 'Genre was successfully destroyed.'
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end
end
