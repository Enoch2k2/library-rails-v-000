class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre
  has_one :cart_books
end
