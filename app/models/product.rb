class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_details
  has_many :tracking_lists
  has_many :images, :inverse_of => :product, :dependent => :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  # self.per_page = 3
  mount_uploader :avatar, AvatarUploader

  def icon_url
    avatar.url
  end
end
