require 'rails_helper'

feature 'Bookmarks can be liked' do

  before do
    @user  = create(:user)
    @user2 = create(:user, email: 'jane@example.com')
    visit '/'
    user_login(@user)
    add_bookmark_to_shoes_topic
  end

  scenario 'by authenticated users successfully' do
    log_out
    user_login(@user2)
    visit '/topics/1'
    within('.likes') do
      find("#like").click
    end
    within('.bookmarks') do
      expect(page).to have_content('1')
    end
  end

  scenario 'on a users own bookmark unsuccessfully' do
    within('.likes') do
      expect(page).to_not have_content("#like")
    end
  end

  scenario 'on a bookmark by the same user twice unsuccessfully' do
    log_out
    user_login(@user2)
    visit '/topics/1'
    within('.likes') do
      find("#like").click
    end
    within('.bookmarks') do
      expect(page).to have_content('1')
    end
    within('.likes') do
      expect(page).to_not have_content("#like")
    end
  end

  scenario 'by a user that is not logged in unsuccessfully' do
    log_out
    visit '/topics/1'
    expect(page).to_not have_content(".likes")
  end

  scenario 'then unliked' do
    visit '/topics/1'
    within('.likes') do
      click_link('Like')
    end
    within('.bookmarks') do
      expect(page).to have_content('1')
    end
    within('.likes') do
      expect(page).to have_content("Unlike")
    end
  end

end 