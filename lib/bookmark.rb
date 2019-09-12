class Bookmark
  attr_reader :title, :url, :id
  attr_writer :title

  def initialize(id: id, title: title, url: url)
    @id = id
    @title = title
    @url = url
  end
end
