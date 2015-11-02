class New < ActiveRecord::Base
  belongs_to :news_category
  self.per_page = 5
end
