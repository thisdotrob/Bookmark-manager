feature 'Filtering links' do

  before (:each) do
    Link.create(url: 'www.google.com',
                title: 'Google',
                tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'www.yahoo.com',
                title: 'Yahoo',
                tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'www.whufc.com',
                title: 'WHUFC',
                tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'www.bubblewrap.tribe.net',
                title: 'Bubble Wrap',
                tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'user can filter by tag' do
    visit '/links/bubbles'
    within 'ul.links' do
      expect(page).to have_content 'Bubble Wrap'
      expect(page).to have_content 'www.bubblewrap.tribe.net'
      expect(page).to have_content 'WHUFC'
      expect(page).to have_content 'www.whufc.com'
    end
  end
end
