# As a user
# So that I can quickly go to a web site I want
# I would like to see a list of links

feature "On my homepage" do
  scenario "I can see list of the links" do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'

    expect(page.status_code).to eq 200

    within 'url#links' do
      expect(page).to have_content('Makers Academy')
    end
    
  end
end
