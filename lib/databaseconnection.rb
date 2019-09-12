class DatabaseConnection
  def setup(database = nil)
    if database
      @con = PG.connect :dbname => database
    else
      if ENV['ENVIRONMENT'] == 'test'
        @con = PG.connect :dbname => 'bookmark_manager_test'
      else
        @con = PG.connect :dbname => 'bookmark_manager'
      end
    end
  end
end
