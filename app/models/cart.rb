class Cart < ActiveRecord::Base
  acts_as_shopping_cart_using :cart_item
  belongs_to :user
  has_many :items, through: :shopping_cart_items, source_type: "Product"
  def tax_pct
    0
  end
  def shipping_cost
    0 # defines a flat $5 rate
  end
end
