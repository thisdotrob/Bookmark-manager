feature "User sign-out" do

  scenario "displays exit message" do
    sign_in
    click_button 'Sign out'
    expect(page).to_not have_content "Welcome to bookmark manager, user1@users.com"
    expect(page).to have_content "Goodbye!"
  end

end
