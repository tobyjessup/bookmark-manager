feature 'Viewing bookmarks' do
  scenario 'when visiting index route' do
    visit('/bookmarks')
    expect(page).to have_content('https://www.window-swap.com/')
    expect(page).to have_content('https://isitchristmas.com/')
    expect(page).to have_content('https://zombo.com/')
  end
end