class CartSerializer < ActiveModel::Serializer
  attributes :id
  has_many :cart_books
end