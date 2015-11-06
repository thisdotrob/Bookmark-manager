feature "On the user sign-up page" do

  scenario "The user count increases by one" do
    4.times { sign_up }
    expect(User.count).to be 5
  end

  scenario "The page displays a welcome message" do
    expect(page).to have_content 'Welcome to bookmark manager, user1'
  end

  scenario "The email address is present in the database" do
    expect(User.first.email).to eq 'user1@users.com'
  end

end
