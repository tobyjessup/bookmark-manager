feature 'Adding a new bookmark' do
  scenario 'user submits a new bookmark entry' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://zombo.com')
    click_button('Submit')

    expect(page).to have_content 'http://zombo.com'
  end
end
