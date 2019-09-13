require 'bookmark'

describe Bookmark do
  it "holds and returns values for bookmark" do
    bookmark = Bookmark.new(id: "1", url: "bbc.co.uk", title: "James")
    expect(bookmark.url).to eq("bbc.co.uk")
  end

  # it "also holds array of comments" do
  #   comment1 = Comment.new(id: 1, comment:"comment1", bookmark_id: 1)
  #   comment2 = Comment.new(id: 2, comment:"comment3", bookmark_id: 1)
  #   comment3 = Comment.new(id: 3, comment:"comment3", bookmark_id: 1)
  #   bookmark = Bookmark.new(id: "1", url: "bbc.co.uk", title: "James", comments:[comment1,comment2,comment3])
  #   expect(bookmark.comments).to eq([comment1,comment2,comment3])
  # end
end
