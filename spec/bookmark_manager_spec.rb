require 'bookmark_manager'
require 'bookmarks_helper'

describe Bookmark_Manager do
  it "returns a list of bookmarks" do
    Bookmark_Helper.new.clear_table
    Bookmark_Helper.new.load_table
    expect(subject.return_bookmarks().first.url).to eq("http://www.makersacademy.com")
  end

  it "adds bookmark" do
    Bookmark_Helper.new.clear_table
    subject.add_bookmark("https://James.Is.Great.com", "James Holton")
    expect(subject.return_bookmarks().first.url).to eq("https://James.Is.Great.com")
    expect(subject.return_bookmarks().first.title).to eq("James Holton")
  end
end
