class Product < ActiveRecord::Base
  belongs_to :category
  # self.per_page = 3
end
