require 'bookmark_manager'
require 'bookmarks_helper'

describe Bookmark_Manager do
  it "returns a list of bookmarks" do
    Bookmark_Helper.new.clear_table
    Bookmark_Helper.new.load_table
    expect(subject.return_bookmarks()).to eq([{:title=>nil, :url=>"http://www.makersacademy.com"}, {:title=>nil, :url=>"http://www.google.com"}, {:title=>nil, :url=>"http://www.destroyallsoftware.com"}])
  end

  it "adds bookmark" do
    Bookmark_Helper.new.clear_table
    subject.add_bookmark("https://James.Is.Great.com", "James Holton")
    expect(subject.return_bookmarks()).to eq([{title: "James Holton", url: "https://James.Is.Great.com"}])
  end
end
