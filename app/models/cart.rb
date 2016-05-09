class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_books
  has_many :books, through: :cart_books

  def add_item(book_id)
    cart_book = self.cart_books.find_by(book_id: book_id)
    if cart_book
      cart_book.quantity += 1
    else
      cart_book = self.cart_books.build(cart_id: self.id, book_id: book_id)
    end
    cart_book
  end

  def total
    cart_total = 0
    self.cart_books.each do |cart_book|
      cart_total += cart_book.book.price.to_f/100 * cart_book.quantity
    end
    cart_total
  end
end
