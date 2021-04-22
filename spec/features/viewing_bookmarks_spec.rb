require 'pg'

feature 'Viewing bookmarks' do
  scenario 'when visiting index route' do
    Bookmark.create(url: 'https://www.window-swap.com/', title: 'Window Swap')
    Bookmark.create(url: 'https://isitchristmas.com/', title: 'Is it christmas?')
    Bookmark.create(url: 'https://zombo.com/', title: 'Zombo')

    visit('/bookmarks')

    expect(page).to have_link('Window Swap', href: 'https://www.window-swap.com/')
    expect(page).to have_link('Is it christmas?', href: 'https://isitchristmas.com/')
    expect(page).to have_link('Zombo', href: 'https://zombo.com/')
  end
end
