class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
    @book = Book.find(params[:book_id])
  end

  def create
    binding.pry
    @book = Book.find(params[:book_id])
    if !params[:genre][:id].empty?
      @genre = Genre.find(params[:genre][:id])
      @genre.books << @book
      @genre.save
      @book.save
      flash[:notice] = "#{@book.title} created successfully."
      redirect_to admin_path(current_user)
    else
      @genre = Genre.create(genre_params)
      @genre.books << @book
      @genre.save
      @book.save
      flash[:notice] = "#{@book.title} created successfully."
      redirect_to admin_path(current_user)
    end
  end

  def genre_params
    params.require(:genre).permit(:id, :name)
  end
end
