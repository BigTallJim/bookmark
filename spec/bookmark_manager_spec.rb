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

  it "returns a bookmark" do
    Bookmark_Helper.new.clear_table
    bookmark = Bookmark_Manager.add_bookmark("https://James.Is.Great.com", "James Holton")
    expect(Bookmark_Manager.get_bookmark(bookmark.id).url).to eq("https://James.Is.Great.com")
  end

  it "updates a bookmark" do
    Bookmark_Helper.new.clear_table
    bookmark = Bookmark_Manager.add_bookmark("https://James.Is.Great.com", "James Holton")
    bookmark.title = "new title"
    expect(Bookmark_Manager.update_bookmark(bookmark).title).to eq("new title")
  end

  it "adds comments for a bookmark" do
    Bookmark_Helper.new.clear_table
    bookmark = Bookmark_Manager.add_bookmark("https://James.Is.Great.com", "James Holton")
    comment = Bookmark_Manager.add_comment(bookmark.id, "What a great bookmark")
    expect(comment).to eq("What a great bookmark")
  end

  it "gets comments for a bookmark" do
    Bookmark_Helper.new.clear_table
    bookmark = Bookmark_Manager.add_bookmark("https://James.Is.Great.com", "James Holton")
    comment = Bookmark_Manager.add_comment(bookmark.id, "What a great bookmark")
    expect(Bookmark_Manager.return_comments(bookmark.id).first.comment).to eq("What a great bookmark")
  end
end
