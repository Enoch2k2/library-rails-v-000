class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :current_cart, :admin
  has_many :carts
end
