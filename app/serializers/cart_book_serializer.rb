class CartBookSerializer < ActiveModel::Serializer
  attributes :id
  has_one :book
  has_one :cart
end
