require 'rails_helper'

RSpec.describe 'Session Authentication', type: :feature do
  let(:user) { User.create name: 'bender', email: 'bender@futurama.com', password: '123456', password_confirmation: '123456' }

  scenario 'Session login' do
    visit new_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: '123456'
    click_button 'Sign In'
    expect(page).to have_content("Hello #{user.name}")
  end

  scenario 'Session logout' do
    visit new_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: '123456'
    click_button 'Sign In'
    click_link 'LogOut'
    expect(page).to have_content('Sign Up')
  end
end