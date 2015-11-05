feature "On the user sign-up page" do

  before :each do
    visit('/')
    fill_in 'username', with: 'user_name'
    fill_in 'email', with: 'email@host.com'
    click_button 'Submit'
  end

  scenario "The user count increases by one" do
    expect(page).to have_content 'User count: 1'
  end

  scenario "The page displays a welcome message" do
    expect(page).to have_content 'Welcome to bookmark manager, user_name'
  end

  scenario "The email address is present in the database" do
    expect(User.first.email).to eq 'email@host.com'
  end

end
