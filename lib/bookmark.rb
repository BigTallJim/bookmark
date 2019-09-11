class Bookmark
  attr_reader :title, :url

  def initialize(id: id, title: title, url: url)
    @id = id
    @title = title
    @url = url
  end
end
