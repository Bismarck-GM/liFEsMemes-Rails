# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  scope :order_by_priority, -> { order(priority: :asc) }

  def self.category_articles(category)
    category.articles.includes(:author, :categories).order('created_at DESC')
  end
end
