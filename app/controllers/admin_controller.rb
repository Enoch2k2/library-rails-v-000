class AdminController < ApplicationController
  def show
    admin_only
  end
  def booklist
    admin_only
    @books = Book.all
  end
end
