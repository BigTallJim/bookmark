require 'bookmark_manager'
require 'bookmarks_helper'

describe Bookmark_Manager do
  it "returns a list of bookmarks" do
    Bookmark_Helper.new.clear_table
    Bookmark_Helper.new.load_table
    expect(subject.return_bookmarks()).to eq(["http://www.makersacademy.com", "http://www.google.com", "http://www.destroyallsoftware.com"])
  end
end
