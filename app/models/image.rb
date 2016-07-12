class Image < ActiveRecord::Base
  belongs_to :product
  mount_uploaders :photos, ProductPhotoUploader
  mount_uploader :photo, ProductPhotoUploader

  def photos_will_change!
    product.images.each do |image|
      image.photo_will_change!
    end
  end
end
