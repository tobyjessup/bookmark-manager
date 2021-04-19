require 'bookmark'

describe Bookmark do
  let(:subject) {described_class.new}


  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include('https://www.window-swap.com/')
      expect(bookmarks).to include('https://isitchristmas.com/')
      expect(bookmarks).to include('https://zombo.com/')
    end
  end
end