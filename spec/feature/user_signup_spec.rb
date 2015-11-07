feature "On the user sign-up page" do

  scenario "The user count increases" do
    4.times { sign_up }
    expect(User.count).to be 5
  end

  scenario "The page displays a welcome message" do
    expect(page).to have_content 'Welcome to bookmark manager, user1'
  end

  scenario "The email address is present in the database" do
    expect(User.first.email).to eq 'user1@users.com'
  end

  scenario "Stays on same page on password mismatch" do
    visit('/')
    fill_in 'username', with: 'user2'
    fill_in 'email', with: 'user2@users.com'
    fill_in 'password', with: 'password1'
    fill_in 'password_confirmation', with: 'xxx'
    click_button 'Submit'
    expect(current_path).to eq('/')
  end

  scenario "Displays error messageo on password mismatch" do
    visit('/')
    fill_in 'username', with: 'user2'
    fill_in 'email', with: 'user2@users.com'
    fill_in 'password', with: 'password1'
    fill_in 'password_confirmation', with: 'xxx'
    click_button 'Submit'
    expect(page).to have_content 'Passwords do not match, try again.'
  end

end
