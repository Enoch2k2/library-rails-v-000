class AuthorsController < ApplicationController

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
