feature 'filtering links by their tags' do

  before (:each) do
    Link.create(url: 'www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'www.yahoo.com', title: 'Yahoo', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'www.whufc.com', title: 'WHUFC', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'www.bubblewrap.tribe.net', title: 'Bubble Wrap', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'filter links by the tag bubbles' do
    visit '/links/bubbles'
    within 'ul.links' do
      expect(page).to have_content 'Title: Bubble Wrap URL: www.bubblewrap.tribe.net'
    end
  end
end
