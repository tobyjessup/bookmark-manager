require 'bookmark'

describe Bookmark do
  let(:subject) {described_class.new}


  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.window-swap.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://isitchristmas.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://zombo.com/');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include('https://www.window-swap.com/')
      expect(bookmarks).to include('https://isitchristmas.com/')
      expect(bookmarks).to include('https://zombo.com/')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.zombo.com')
  
      expect(Bookmark.all).to include 'http://www.zombo.com'
    end
  end
end
 