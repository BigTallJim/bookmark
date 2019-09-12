require 'sinatra/base'
require './lib/bookmark_manager'

class Bookmark_app < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @screen_message = params[:message]
    @bookmarks = Bookmark_Manager.return_bookmarks
    erb :bookmarks
  end

  get '/bookmarks/new' do
    @return_value_for_screen = 'enter your url'
    erb :createbookmark
  end

  post '/bookmarks' do
    newurl = params[:newurl]
    title = params[:title]
    if newurl.length > 0 && is_valid_url(newurl)
      Bookmark_Manager.add_bookmark(newurl, title)
      message = "Bookmark added successfully"
    else
      message = "No Bookmark entered, and blank or invalid"
    end
    redirect "/bookmarks?message=#{message}"
  end

  post '/deletebookmark' do
    Bookmark_Manager.delete_bookmark(params["DeleteURL"])
    message = "Bookmark deleted"
    redirect "/bookmarks?message=#{message}"
  end

  def is_valid_url(url)
    uri = URI.parse url
    uri.kind_of? URI::HTTP
  rescue URI::InvalidURIError
    false
  end
end
