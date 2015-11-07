module SessionHelpers

  def sign_up
    visit('/users/new')
    fill_in 'email', with: 'user1@users.com'
    fill_in 'password', with: 'password1'
    fill_in 'password_confirmation', with: 'password1'
    click_button 'Submit'
  end

  def sign_in
    visit('/')
    fill_in 'email', with: 'user1@users.com'
    fill_in 'password', with: 'password1'
    click_button 'Sign in'
  end

end
