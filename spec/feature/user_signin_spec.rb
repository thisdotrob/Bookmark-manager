feature "On the user sign-in page" do

  scenario "Displays a welcome message to the user" do
    visit('/sign-in')
    fill_in 'email', with: 'user1@users.com'
    fill_in 'password', with: 'password1'
    click_button 'Sign in'
    expect(page).to have_content 'Welcome to bookmark manager, user1@users.com'
  end

end
