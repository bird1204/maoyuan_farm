class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :cart
  has_many :tracking_lists
  has_many :tracking_products, through: :tracking_lists
  has_many :orders

  after_save :init_cart
  
  private 
  
  def init_cart
    Cart.create(user_id: id) unless cart
  end
end
