require 'rails_helper'
require './spec/common/model_helpers'
require './spec/common/session_helpers'

RSpec.describe 'Categories Page', type: :feature do
  include ModelHelpers
  include SessionsHelper

  let(:user) { User.create user_data }
  let(:category1) { Category.create category_data }
  let(:category2) { Category.create category_data }
  let!(:article1) { user.articles.create article_data.merge(category_ids: [category1.id]) }
  let!(:article2) { user.articles.create article_data.merge(category_ids: [category2.id]) }

  scenario 'Filters articles by category' do
    visit category_path(category1.id)
    expect(page).to have_content(article1.title)
    expect(page).not_to have_content(article2.title)
  end

  scenario 'Show the correct number of votes for each article' do
    user.voted_articles << article2
    visit article_path(article2)

    expect(page).to have_content(article2.votes.count)
  end

  scenario 'Not allow unauthenticated users to vote' do
    visit article_path(article1)

    click_on(class: 'is-size-4 orange')

    expect(page).to have_current_path(new_session_path)
  end

  scenario 'Allow logged in users to vote for articles' do
    login_user
    visit article_path(article1)
    click_on(class: 'is-size-4 orange')
    article1.reload
    expect(article1.votes.count).to eq(1)
    expect(page).to have_content(article1.votes.count)
  end

  scenario 'Not allow users to vote for the same article more than once' do
    login_user
    visit article_path(article1)
    click_on(class: 'is-size-4 orange')
    click_on(class: 'is-size-4 orange')

    article1.reload
    expect(article1.votes.count).to eq(1)
    expect(page).to have_content(article1.votes.count)
  end
end
