module SessionsHelper
  def login_user
    visit new_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Sign In'
  end
end
