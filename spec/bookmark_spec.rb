require 'bookmark'

describe Bookmark do
  it "holds and returns values for bookmark" do
    bookmark = Bookmark.new(url: "bbc.co.uk", title: "James")
    expect(bookmark.url).to eq("bbc.co.uk")
  end
end
