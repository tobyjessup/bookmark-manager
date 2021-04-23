feature 'Updating a bookmark' do
    scenario 'A user can update a bookmark' do
      bookmark = Bookmark.create(url: 'http://zombo.com', title: 'Zombo')
      visit('/bookmarks')
      expect(page).to have_link('Zombo', href: 'http://zombo.com')
  
      first('.bookmark').click_button 'Update'
      expect(current_path).to eq "/bookmarks/#{bookmark.id}/update"
  
      fill_in('url', with: "http://www.newzombo.com")
      fill_in('title', with: "New Zombo")
      click_button('Submit')
  
      expect(current_path).to eq '/bookmarks'
      expect(page).not_to have_link('Zombo', href: 'http://zombo.com')
      expect(page).to have_link('New Zombo', href: 'http://www.newzombo.com')
    end
  end

