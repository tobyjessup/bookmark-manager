require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
    erb :"/bookmarks/index"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    p @bookmarks
    erb :"bookmarks/bookmarks"
  end

  get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end

  post '/bookmarks' do
    # p params
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
