feature "User sign-in" do

  scenario "successful sign-in displays welcome message" do
    sign_in
    expect(page).to have_content 'user1@users.com signed in.'
  end

end
