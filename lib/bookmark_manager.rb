require 'pg'
require_relative './bookmark'

class Bookmark_Manager
  def return_bookmarks
    bookmarks = []
    begin
      con = get_database_connection
      rs = con.exec 'SELECT id, title, url from bookmarks order by title'
      rs.each do |row|
        bookmarks << Bookmark.new(id: row["id"], title: row["title"], url: row["url"])
      end
    rescue PG::Error => e
      puts e.message
    ensure
      rs.clear if rs
      con.close if con
    end
    bookmarks
  end

  def add_bookmark(bookmark, title = "default")
    begin
      con = get_database_connection
      rs = con.exec "INSERT INTO bookmarks (title, url) VALUES('#{title}','#{bookmark}') RETURNING id, title, url;"
      bookmark = Bookmark.new(id: rs[0]['id'], title: rs[0]['title'], url: rs[0]['url'])
    rescue PG::Error => e
      puts e.message
    ensure
      rs.clear if rs
      con.close if con
    end
  end

  def delete_bookmark(id)
    begin
      con = get_database_connection
      rs = con.exec "DELETE FROM bookmarks WHERE id = '#{id}'"
    rescue PG::Error => e
      puts e.message
    ensure
      rs.clear if rs
      con.close if con
    end
  end

  private
  def get_database_connection
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
  end
end
