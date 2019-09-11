require 'sinatra/base'
require './lib/bookmark_manager'

class Bookmark_app < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    bookmark_manager = Bookmark_Manager.new
    @bookmarks = bookmark_manager.return_bookmarks
    erb :bookmarks
  end

  get '/createbookmark' do
    @return_value_for_screen = 'enter your url'
    erb :createbookmark
  end

  post '/createbookmark' do
    newurl = params[:newurl]
    title = params[:title]
    bookmark_manager = Bookmark_Manager.new
    bookmark_manager.add_bookmark(newurl, title)
    @return_value_for_screen = 'url added successfully'
    redirect '/bookmarks'
  end
end
