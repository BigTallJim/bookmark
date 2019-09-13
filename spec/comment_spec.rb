require 'comment'

describe Comment do
  it "holds and returns comments for a bookmark" do
    comment = Comment.new(id: 1, comment:"comment1", bookmark_id: 1)
    expect(comment.comment).to eq("comment1")
  end
end
