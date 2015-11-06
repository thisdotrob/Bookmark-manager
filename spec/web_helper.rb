def sign_up
  visit('/')
  fill_in 'username', with: 'user1'
  fill_in 'email', with: 'user1@users.com'
  fill_in 'password', with: 'password1'
  fill_in 'password_check', with: 'password1'
  click_button 'Submit'
end
