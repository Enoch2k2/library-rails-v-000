class AuthorsController < ApplicationController

  def new
    admin_only
    @author = Author.new
    @authors = Author.all
  end

  def create
    admin_only
    if params[:author][:id].empty?
      @author = Author.create(author_params)
      flash[:notice] = "Successfully Created #{@author.name}."
      redirect_to new_author_book_path(@author)
    else
      @author = Author.find(params[:author][:id])
      flash[:notice] = "Successfully selected #{@author.name}."
      redirect_to new_author_book_path(@author)
    end
  end

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:id, :name)
  end
end
