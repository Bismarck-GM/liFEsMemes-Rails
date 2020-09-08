class Article < ApplicationRecord
  belongs_to :author, class_name: User.name
  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :categories

  has_one_attached :image

end
