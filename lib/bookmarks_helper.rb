require 'pg'

class Bookmark_Helper
  def clear_table
      DatabaseConnection.query('TRUNCATE TABLE bookmarks CASCADE')
  end

  def load_table
      DatabaseConnection.query("INSERT into bookmarks (url) VALUES('http://www.makersacademy.com')")
      DatabaseConnection.query("INSERT into bookmarks (url) VALUES('http://www.google.com')")
      DatabaseConnection.query("INSERT into bookmarks (url) VALUES('http://www.destroyallsoftware.com')")
  end
end
