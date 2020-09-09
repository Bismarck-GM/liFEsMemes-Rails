class Article < ApplicationRecord
  belongs_to :author, class_name: User.name
  mount_uploader :image, ImageUploader

  has_many :article_categories
  has_many :categories, through: :article_categories

  has_one_attached :image

end
