class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  scope :order_by_priority, -> { order(priority: :asc) }
end
