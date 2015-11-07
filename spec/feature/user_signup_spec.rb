feature "On the user sign-up page" do

  scenario "The user count increases" do
    expect(User.count).to be 1
  end

  scenario "The page displays a welcome message" do
    expect(page).to have_content 'Welcome to bookmark manager, user1@users.com'
  end

  scenario "The email address is present in the database" do
    expect(User.first.email).to eq 'user1@users.com'
  end

  scenario "User can't sign up when password do not match" do
    visit('/users/new')
    fill_in 'email', with: 'user2@users.com'
    fill_in 'password', with: 'password1'
    fill_in 'password_confirmation', with: 'xxx'
    click_button 'Submit'
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Passwords do not match.'
  end

  scenario "User can't sign up without entering an email" do
    visit('/users/new')
    fill_in 'password', with: 'password1'
    fill_in 'password_confirmation', with: 'password1'
    click_button 'Submit'
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Email is empty.'
  end

  scenario "User can't sign up with invalid formatted email address" do
    visit('/users/new')
    fill_in 'email', with: 'user2@users'
    fill_in 'password', with: 'password1'
    fill_in 'password_confirmation', with: 'password1'
    click_button 'Submit'
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Incorrect email format.'
  end

  scenario "User can't sign up with an email address that is already in use" do
    sign_up
    expect(page).to have_content 'User already exists.'
  end

end
