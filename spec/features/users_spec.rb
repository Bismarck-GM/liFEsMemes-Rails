require 'rails_helper'
require './spec/common/model_helpers'

RSpec.describe 'Sign Up', type: :feature do
  include ModelHelpers
  let(:user) { User.create user_data }
  let!(:category) { Category.create category_data }
  let!(:article1) { user.articles.create article_data.merge(category_ids: category.id) }

  scenario 'Sign Up' do
    visit new_user_path

    fill_in 'user[name]', with: 'bender'
    fill_in 'user[email]', with: 'bender@futurama.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'

    click_button 'Create User'

    expect(page).to have_current_path(root_path)
  end

  scenario 'User already exists' do
    visit new_user_path

    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation

    click_button 'Create User'

    expect(page).to have_content('Name has already been taken')
  end

  scenario 'Username can not be blank' do
    visit new_user_path

    fill_in 'user[name]', with: ''
    fill_in 'user[email]', with: 'bender@ass.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'

    click_button 'Create User'

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'Passwords should match' do
    visit new_user_path

    fill_in 'user[name]', with: 'bender'
    fill_in 'user[email]', with: 'bender@asd.com'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123546'

    click_button 'Create User'

    expect(page).to have_content("Password confirmation doesn't match")
  end
end