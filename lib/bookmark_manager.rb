require 'pg'

class Bookmark_Manager
  def return_bookmarks
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'student'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'student'
    end

    rs = con.exec 'SELECT url from bookmarks'

    bookmarks = []
    begin
      rs.each do |row|
        bookmarks << row['url']
      end
    rescue PG::Error => e
      puts e.message
    ensure
      rs.clear if rs
      con.close if con
    end
    bookmarks
  end
end
