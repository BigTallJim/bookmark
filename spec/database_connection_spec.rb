require 'database_connection'

describe DatabaseConnection do
  it "returns a test database connection" do
    expect(DatabaseConnection.setup("bookmark_manager_test")).to be_a_kind_of(PG::Connection)
  end

  it "executes a SQL query" do
    DatabaseConnection.setup("bookmark_manager_test")
    expect(DatabaseConnection.query("SELECT * FROM bookmarks")).to be_a_kind_of(PG::Result)
  end

  it "checks connection is still there" do
    expect(DatabaseConnection.connection).to be_a_kind_of(PG::Connection)
  end
end
