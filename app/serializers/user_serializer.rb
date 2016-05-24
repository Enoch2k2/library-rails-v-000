class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :current_cart
  has_many :carts
end
