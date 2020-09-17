# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :author, class_name: User.name
  has_one_attached :image
  mount_uploader :image, ImageUploader
  has_many :votes
  has_many :article_categories
  has_many :categories, through: :article_categories

  scope :possess_votes, -> { select('articles.*, COUNT(votes.user_id) as votes_count').left_joins(:votes).group(:id) }
  scope :most_voted, -> { possess_votes.order(votes_count: :desc) }

  validates :title, presence: true, length: { minimum: 1, maximum: 150 }
  validates :title, :text, :image, :category_ids, presence: true
end
