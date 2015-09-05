class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_details
  has_many :tracking_lists
  # self.per_page = 3
  mount_uploader :avatar, AvatarUploader

  def image
    avatar.url
  end
end
