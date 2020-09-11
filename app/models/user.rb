class User < ApplicationRecord
  has_secure_password
  has_many :articles, foreign_key: 'author_id'
  has_many :votes
  has_many :voted_articles, through: :votes, source: :article

  validates :name, :email, presence: true
  validates :name, :email, uniqueness: { :case_sensitive => false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
