feature 'Adding a new bookmark' do
  scenario 'user submits a new bookmark entry' do
    visit('/bookmarks/new')
    p page
    fill_in('url', with: 'http://zombo.com')
    fill_in('title', with: 'Zombo')
    click_button('Submit')

    expect(page).to have_link('Zombo', href: 'http://zombo.com')
  end
end
