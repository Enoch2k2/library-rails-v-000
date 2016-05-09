class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:id, :name)
  end
end
