require 'bookmark'
require 'database_helpers'

describe Bookmark do
  let(:subject) {described_class.new}

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: 'https://www.window-swap.com/', title: 'Window Swap')
      Bookmark.create(url: 'https://isitchristmas.com/', title: 'Is it christmas?')
      Bookmark.create(url: 'https://zombo.com/', title: 'Zombo')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Window Swap'
      expect(bookmarks.first.url).to eq 'https://www.window-swap.com/'
    end
  end

  describe '.create' do
    it 'creates a new bookmark test 2' do
      bookmark = Bookmark.create(url: 'http://www.zombo.com', title: 'Zombo')

      persisted_data = persisted_data(id: bookmark.id)
  
  
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data["id"]
      expect(bookmark.title).to eq 'Zombo'
      expect(bookmark.url).to eq 'http://www.zombo.com'
    end
  end
end
 