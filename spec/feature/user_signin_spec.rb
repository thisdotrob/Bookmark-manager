feature "User sign-in" do

  scenario "successful sign-in displays welcome message" do
    sign_in
    expect(page).to have_content 'Logged in as user1@users.com.'
  end

end
