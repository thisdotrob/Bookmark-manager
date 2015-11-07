feature "User signs out" do

  scenario "displays good bye message" do
    visit('/sessions/new')
    fill_in 'email', with: 'user1@users.com'
    fill_in 'password', with: 'password1'
    click_button 'Sign in'
    click_button 'Sign out'
    expect(page).to_not have_content "Welcome to bookmark manager, user1@users.com"
    expect(page).to have_content "Goodbye!"
  end

end
