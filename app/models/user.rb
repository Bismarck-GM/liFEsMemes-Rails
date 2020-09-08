class User < ApplicationRecord
  has_secure_password

  has_many :articles, foreign_key: 'author_id'

  validates :name, :email, presence: true
  validates :name, :email, uniqueness: { :case_sensitive => false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
