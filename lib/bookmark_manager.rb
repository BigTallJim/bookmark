require 'pg'

class Bookmark_Manager
  def return_bookmarks
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    end

    rs = con.exec 'SELECT title, url from bookmarks'
    bookmarks = []
    begin
      rs.each do |row|
        newHash = {:title => row["title"], :url => row["url"]}
        bookmarks << newHash
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
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    end

    rs = con.exec "INSERT INTO bookmarks (title, url) VALUES('#{title}','#{bookmark}')"

    begin
    rescue PG::Error => e
      puts e.message
    ensure
      rs.clear if rs
      con.close if con
    end
  end
end
