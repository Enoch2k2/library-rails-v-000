class CartBook < ActiveRecord::Base
  belongs_to :cart
  belongs_to :book
end
