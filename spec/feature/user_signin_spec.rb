feature "On the user sign-in page" do

  scenario "Displays a welcome message to the user" do
    visit('/')
    fill_in 'email', with: 'user1@users.com'
    fill_in 'password', with: 'password1'
    click_button 'Sign in'
    expect(page).to have_content 'user1@users.com signed in.'
  end

end
