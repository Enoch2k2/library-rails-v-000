class CartBookSerializer < ActiveModel::Serializer
  attributes :id
  has_one :cart
end
