def sign_up
  visit('/')
  click_button 'Sign up'
  fill_in 'email', with: 'user1@users.com'
  fill_in 'password', with: 'password1'
  fill_in 'password_confirmation', with: 'password1'
  click_button 'Submit'
end
