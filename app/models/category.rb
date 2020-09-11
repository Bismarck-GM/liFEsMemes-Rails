class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  def self.category_articles(category)
    category.articles.includes(:author, :categories).order('created_at DESC')
  end
end
