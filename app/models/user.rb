class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :
  devise :database_authenticatable, :registerable, :recoverable,
  :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :carts
  belongs_to :current_cart, :class_name => "Cart"
  has_many :purchase_history, :class_name => "Cart"

  def create_cart
    self.current_cart ||= Cart.create
    self.current_cart.user_id = self.id
    self.current_cart.save
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def current_cart_purchase(current_cart)
    
  end
end
