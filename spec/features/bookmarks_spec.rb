require 'rails_helper'

feature 'Bookmarks' do

	before do
    @user = create(:user)
		visit '/'
    click_log_in
    fill_login_credentials
  	add_topic
	end
  
  scenario 'can be added to a topic successfully' do
    click_link('Shoes')
    click_link('New bookmark')
  	within('form') do
  		fill_in('Url', with: 'www.google.com')
  		click_button('Create Bookmark')
  	end
  	expect(page).to have_content('www.google.com')
  end

end