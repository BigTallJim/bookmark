feature 'Bookmark manager' do

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
    click_button('Save')
    expect(page).to have_content('http://gmail.com')
  end

end
