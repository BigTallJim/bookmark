require 'pg'
require_relative './bookmark'

class Bookmark_Manager

  def self.return_bookmarks
    bookmarks = []
      rs = DatabaseConnection.query('SELECT id, title, url from bookmarks order by title')
      rs.each do |row|
        bookmarks << Bookmark.new(id: row["id"], title: row["title"], url: row["url"])
      end
    bookmarks
  end

  def self.get_bookmark(id)
      rs = DatabaseConnection.query("SELECT id, title, url from bookmarks where id = '#{id}'")
      bookmark = Bookmark.new(id: rs[0]['id'], title: rs[0]['title'], url: rs[0]['url'])
  end

  def self.add_bookmark(bookmark, title = "default")
      rs = DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES('#{title}','#{bookmark}') RETURNING id, title, url;")
      bookmark = Bookmark.new(id: rs[0]['id'], title: rs[0]['title'], url: rs[0]['url'])
  end

  def self.delete_bookmark(id)
      rs = DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{id}'")
  end

  def self.update_bookmark(bookmark)
      rs = DatabaseConnection.query("UPDATE bookmarks SET title = '#{bookmark.title}', url = '#{bookmark.url}' WHERE id = '#{bookmark.id}' RETURNING id, title, url;")
      bookmark = Bookmark.new(id: rs[0]['id'], title: rs[0]['title'], url: rs[0]['url'])
  end
end
