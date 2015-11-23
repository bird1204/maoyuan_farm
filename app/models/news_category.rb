class NewsCategory < ActiveRecord::Base
  has_many :hot_news, class_name: 'New' 
end
