require 'pg'

feature 'Viewing bookmarks' do
  scenario 'when visiting index route' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.window-swap.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://isitchristmas.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('https://zombo.com/');")

    visit('/bookmarks')

    expect(page).to have_content 'https://www.window-swap.com/'
    expect(page).to have_content 'https://isitchristmas.com/'
    expect(page).to have_content 'https://zombo.com/'
  end
end
