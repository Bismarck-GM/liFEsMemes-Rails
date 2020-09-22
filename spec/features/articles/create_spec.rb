require 'rails_helper'
require 'faker'
require './spec/common/model_helpers'
require './spec/common/session_helpers'

RSpec.describe 'Create new articles', type: :feature do
  include ModelHelpers
  include SessionsHelper
  let(:user) { User.create user_data }
  let(:category) { Category.create category_data }

  scenario 'Does not allow unauthenticated users to create memes' do
    visit new_article_path
    expect(page).to have_current_path(new_session_path)
  end

  scenario 'Shows validation errors' do
    login_user
    visit new_article_path
    click_button 'Create Meme'
    expect(page).to have_content('Title can\'t be blank')
  end

  scenario 'Creates memes article successfully' do
    login_user

    category.id

    visit new_article_path

    fill_in 'article[title]', with: Faker::Lorem.sentence
    fill_in 'article[text]', with: Faker::Lorem.paragraph
    select category.name, from: 'article[category_ids][]'
    attach_file('article[image]', Rails.root.join('app', 'assets', 'images', 'LifesMemesBrownBackground-01-01.png'))
    click_button 'Create'

    expect(page).to have_current_path(root_path)
    expect(page).to have_content(Article.first.title)
  end
end