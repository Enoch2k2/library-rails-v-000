class CartBooksController < ApplicationController

  def create
    current_user.create_cart
    current_user.current_cart.add_item(params[:book_id]).save
    current_user.current_cart.save
    current_user.save
    @book = Book.find(params[:book_id])
    respond_to do |format|
      format.html {render html: '/'}
      format.json {render json: @book, adapter: :json }
    end
  end

  def destroy
    @cart_book = current_user.current_cart.cart_books.find(params[:id])
    @cart_book.quantity -= 1
    @cart_book.save
    if @cart_book.quantity == 0
      @cart_book.delete
    end
    if current_user.current_cart.cart_books.empty?
      flash[:notice] = "#{@cart_book.book.title} has been removed from cart."
      current_user.current_cart.delete
      redirect_to root_path
    else
      flash[:notice] = "#{@cart_book.book.title} has been removed from cart."
      redirect_to cart_path(current_user.current_cart)
    end
  end
end
