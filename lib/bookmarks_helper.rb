require 'pg'

class Bookmark_Helper
  def clear_table (database = 'bookmark_manager_test')
    begin
      con = PG.connect :dbname => database
      rs = con.exec 'TRUNCATE TABLE bookmarks'
    rescue PG::Error => e
      puts e.message
    ensure
      rs.clear if rs
      con.close if con
    end
  end

  def load_table (database = 'bookmark_manager_test')
    begin
      con = PG.connect :dbname => database
      con.exec "INSERT into bookmarks (url) VALUES('http://www.makersacademy.com')"
      con.exec "INSERT into bookmarks (url) VALUES('http://www.google.com')"
      con.exec "INSERT into bookmarks (url) VALUES('http://www.destroyallsoftware.com')"
    rescue PG::Error => e
      puts e.message
    ensure
      con.close if con
    end
  end
end
