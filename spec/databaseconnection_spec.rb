require 'databaseconnection'

describe DatabaseConnection do
  it "returns a test database connection" do
    expect(subject.setup("bookmark_manager_test")).to be_a_kind_of(PG::Connection)
  end

  it "executes a SQL query" do
    subject.setup()
    expect(subject.query("SELECT * FROM return_bookmarks")).to be_a_kind_of(Array)
  end
end
