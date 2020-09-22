require 'rails_helper'
require './spec/common/model_helpers'

RSpec.describe 'Articles Index - Main Page', type: :feature do
  include ModelHelpers
  let!(:user) { User.create user_data }
  let!(:category) { Category.create category_data }
  let!(:article1) { user.articles.create article_data.merge(category_ids: category.id) }
  let!(:article2) { user.articles.create article_data.merge(category_ids: category.id) }

  scenario 'Displays the most voted article in full width correctly' do
    user.voted_articles << article2
    visit root_path
    expect(page).to have_content(article2.title)
  end

  scenario 'Displays categories with the title of the most recent article' do
    visit root_path
    expect(page).to have_content(category.name)
    expect(page).to have_content(article2.title)
  end
end
