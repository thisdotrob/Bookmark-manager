feature "User sign-in" do

  scenario "displays error if password is wrong" do
    visit('/')
    fill_in 'email', with: 'user1@users.com'
    fill_in 'password', with: 'wrong_password'
    click_button 'Sign in'
    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content 'Log in details incorrect.'
  end

  scenario "displays error if user does not exist" do
    visit('/')
    fill_in 'email', with: 'non_existent@users.com'
    fill_in 'password', with: 'password1'
    click_button 'Sign in'
    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content 'Log in details incorrect.'
  end

  scenario "successful sign-in displays welcome message" do
    visit('/')
    fill_in 'email', with: 'user1@users.com'
    fill_in 'password', with: 'password1'
    click_button 'Sign in'
    expect(current_path).to eq('/links')
    expect(page).to have_content 'Logged in as user1@users.com'
  end

end
