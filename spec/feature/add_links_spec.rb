feature 'Adding links' do

  before :each do
    visit '/links/new'
    fill_in 'title', with: 'bitcoin'
    fill_in 'url', with: 'https://bitcoin.org/en/'
  end

  scenario 'user can add a link' do
    click_on 'Create link'
    expect(current_path).to eq('/links')
    within 'ul.links' do
      expect(page).to have_content('bitcoin')
    end
  end

  scenario 'user can add tags' do
    fill_in 'tags', with: 'cryptocurrency finance geek'
    click_on 'Create link'
    expect(Link.first.tags.map(&:name)).to eq ['cryptocurrency', 'finance', 'geek']
  end

end
