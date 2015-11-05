feature 'filtering links by their tags' do

  scenario 'filter links by the tag bubbles' do
    link1 = Link.create(url: 'www.google.com', title: 'Google')
    link2 = Link.create(url: 'www.bubbles.com', title: 'Bubble')
    tag = Tag.create(name: 'bubbles')

    link2.tags << tag
    link2.save

    visit '/links/bubbles'
    expect(page).to have_content 'Title: Bubble URL: www.bubbles.com'
  end
end
