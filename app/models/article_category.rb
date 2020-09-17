# frozen_string_literal: true

class ArticleCategory < ApplicationRecord
  belongs_to :category
  belongs_to :article
end
