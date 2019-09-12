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
    visit '/bookmarks/new'
    fill_in('newurl',with: 'http://gmail.com')
    fill_in('title',with: 'James')
    click_button('Save')
    expect(page).to have_content('http://gmail.com')
    expect(page).to have_content('James')
  end

  scenario 'create and delete bookmark' do
    Bookmark_Helper.new.clear_table
    visit '/bookmarks/new'
    fill_in('newurl',with: 'http://gmail.com')
    fill_in('title',with: 'James')
    click_button('Save')
    expect(page).to have_content('http://gmail.com')
    expect(page).to have_content('Bookmark added successfully')
    click_button('Delete')
    expect(page).to have_content("Bookmark deleted")
    expect(page).to have_no_content('http://gmail.com')
  end
end
