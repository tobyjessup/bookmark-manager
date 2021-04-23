feature 'Deleting a bookmark' do
    scenario 'A user can delete a bookmark' do
      Bookmark.create(url: 'http://zombo.com', title: 'Zombo')
      visit('/bookmarks')
      expect(page).to have_link('Zombo', href: 'http://zombo.com')
  
      first('.bookmark').click_button 'Delete'
  
      expect(current_path).to eq '/bookmarks'
      expect(page).not_to have_link('Zombo', href: 'http://zombo.com')
    end
  end