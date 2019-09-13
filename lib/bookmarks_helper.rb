require 'pg'

class Bookmark_Helper
  def clear_table
      DatabaseConnection.query('TRUNCATE TABLE bookmarks CASCADE')
  end

  def load_table
      DatabaseConnection.query("INSERT into bookmarks (id, url) VALUES(1, 'http://www.makersacademy.com')")
      DatabaseConnection.query("INSERT into bookmarks (id, url) VALUES(2, 'http://www.google.com')")
      DatabaseConnection.query("INSERT into bookmarks (id, url) VALUES(3, 'http://www.destroyallsoftware.com')")
      DatabaseConnection.query("INSERT into comments (id, comment, bookmark_id) VALUES(1, 'comment1', 1)")
  end
end
