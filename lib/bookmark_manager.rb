require 'pg'
require_relative './bookmark'

class Bookmark_Manager
  def return_bookmarks
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end

    rs = con.exec 'SELECT id, title, url from bookmarks order by title'
    bookmarks = []
    begin
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
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end

    rs = con.exec "INSERT INTO bookmarks (title, url) VALUES('#{title}','#{bookmark}') RETURNING id, title, url;"
    bookmark = Bookmark.new(id: rs[0]['id'], title: rs[0]['title'], url: rs[0]['url'])

    begin
    rescue PG::Error => e
      puts e.message
    ensure
      rs.clear if rs
      con.close if con
    end
    bookmark
  end

  def delete_bookmark(id)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end

    rs = con.exec "DELETE FROM bookmarks WHERE id = '#{id}'"

    begin
    rescue PG::Error => e
      puts e.message
    ensure
      rs.clear if rs
      con.close if con
    end
  end

end
