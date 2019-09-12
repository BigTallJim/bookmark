require 'sinatra/base'
require './lib/bookmark_manager'

class Bookmark_app < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @screen_message = params[:message]
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
    if newurl.length > 0
      bookmark_manager = Bookmark_Manager.new
      bookmark_manager.add_bookmark(newurl, title)
      message = "Bookmark added successfully"
    else
      message = "No Bookmark entered"
    end
    redirect "/bookmarks?message=#{message}"
  end
end
