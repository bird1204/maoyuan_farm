class Image < ActiveRecord::Base
  belongs_to :product
  validates :product, presence: true
  mount_uploader :avatar, ImageUploader

  def image_url
    avatar.url
  end

end
