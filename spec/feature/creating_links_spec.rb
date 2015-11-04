feature 'creating links' do

  scenario 'I can add the site address and title to my bookmark manager' do
    visit '/links'
    click_on 'Add new link'
    fill_in 'title', with: 'bitcoin'
    fill_in 'url', with: 'https://bitcoin.org/en/'
    click_on 'Create link'
    # Link.create(url: 'https://bitcoin.org/en/', title: 'bitcoin')
    expect(current_path).to eq('/links')
    within 'ul.links' do
      expect(page).to have_content('bitcoin')
    end
  end

end
