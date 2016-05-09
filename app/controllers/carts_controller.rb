class CartsController < ApplicationController

  def show
    @cart = current_user.current_cart
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.cart_books.each do |cart_book|
      Book.find(cart_book.book_id).decrement(:inventory, cart_book.quantity).save
    end
    current_user.current_cart = nil
    current_user.save
    flash[:notice] = "Thank you for your puchase!"
    redirect_to root_path
  end
end
