require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

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

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"/bookmarks/update"
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end 


  run! if app_file == $PROGRAM_NAME
end
