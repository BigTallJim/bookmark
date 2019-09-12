require 'bookmark_manager'
require 'bookmarks_helper'

describe Bookmark_Manager do
  it "returns a list of bookmarks" do
    Bookmark_Helper.new.clear_table
    Bookmark_Helper.new.load_table
    expect(Bookmark_Manager.return_bookmarks().first.url).to eq("http://www.makersacademy.com")
  end

  it "adds bookmark" do
    Bookmark_Helper.new.clear_table
    Bookmark_Manager.add_bookmark("https://James.Is.Great.com", "James Holton")
    expect(Bookmark_Manager.return_bookmarks().first.url).to eq("https://James.Is.Great.com")
    expect(Bookmark_Manager.return_bookmarks().first.title).to eq("James Holton")
  end

  it "deletes a bookmark" do
    Bookmark_Helper.new.clear_table
    bookmark = Bookmark_Manager.add_bookmark("https://James.Is.Great.com", "James Holton")
    Bookmark_Manager.delete_bookmark(bookmark.id)
    expect(Bookmark_Manager.return_bookmarks).to be_empty
  end
end
