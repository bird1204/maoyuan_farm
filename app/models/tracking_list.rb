class TrackingList < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  self.per_page = 5
end
