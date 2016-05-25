class BooksController < ApplicationController
  def new
    admin_only
    @book = Book.new(author_id: params[:author_id])
  end

  def create
    admin_only
    @book = Book.find_by(title: params[:book][:title])
    if @book
      flash[:notice] = "Book already exists"
      redirect_to new_book_path
    else
      @book = Book.create(book_params)
      @book.author = Author.find(params[:book][:author_id]) if !params[:book][:author_id].empty?
      @book.genre = Genre.find(params[:book][:genre_id]) if !params[:book][:genre_id].empty?
      @book.save
      @book.author.save
      @book.genre.save
      flash[:notice] = "#{@book.title} successfully added."
      redirect_to admin_path(current_user)
    end
  end

  def index
    @books = Book.available_books
    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end

  def show
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @book, adapter: :json}
    end
  end

  def edit
    admin_only
    @book = Book.find(params[:id])
  end

  def update
    admin_only
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "#{@book.title} successfully updated!"
      redirect_to admin_path(current_user)
    else
      flash[:alert] = "There was a problem"
      redirect_to edit_book_path(@book)
    end
  end

  def destroy
    admin_only
    @book = Book.find(params[:id])
    book_title = @book.title
    @book.delete
    respond_to do |format|
      format.html {render html: "admin/#{current_user.id}"}
      format.json {render json: @book}
    end
  end

  def book_params
    params.require(:book).permit(:title, :price, :inventory, :author_id, :genre_id, author_attribute: [:name], genre_attribute: [:name])
  end
end
