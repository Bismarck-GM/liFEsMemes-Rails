# frozen_string_literal: true

class Vote < ApplicationRecord
  belongs_to :article
  belongs_to :user
end
