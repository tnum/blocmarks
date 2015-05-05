require 'rails_helper'

feature 'User profiles' do

  before do
    @user  = create(:user)
    visit '/'
    user_login(@user)
    add_bookmark_to_shoes_topic
    like_bookmark
  end

  scenario 'can be visited by registered users successfully' do
    click_link 'John Smith'
    expect(page).to have_content('Christian Louboutins')
  end

  scenario 'can be visited by unregistered users unsuccessfully' do
    log_out
    expect(page).to_not have_link('John Smith')
  end

end