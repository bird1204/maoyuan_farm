class Order < ActiveRecord::Base
  has_many :order_details
  belongs_to :payment_method
  belongs_to :user
end
