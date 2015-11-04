feature 'adding tags to links' do

  scenario 'I can add a tag to a link so I can group my links together in relevant categories' do
    visit '/links/new'
    fill_in 'title', with: 'bitcoin'
    fill_in 'url', with: 'https://bitcoin.org/en/'
    fill_in 'tags', with: 'cryptocurrency'
    click_on 'Create link'

    link = Link.first
    expect(link.tags.map(&:name)).to include('cryptocurrency')
  end
end
