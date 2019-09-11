feature 'Bookmark features' do

  scenario 'hello world' do
    visit '/'
    expect(page).to have_content('hello world')
  end

  scenario 'view bookmarks' do
    Bookmark_Helper.new.clear_table
    Bookmark_Helper.new.load_table
    visit '/bookmarks'
    expect(page).to have_content('http://www.makersacademy.com')
  end

  scenario 'create bookmark' do
    Bookmark_Helper.new.clear_table
    visit '/createbookmark'
    fill_in('newurl',with: 'http://gmail.com')
    fill_in('title',with: 'James')
    click_button('Save')
    expect(page).to have_content('http://gmail.com')
    expect(page).to have_content('James')
  end
end
