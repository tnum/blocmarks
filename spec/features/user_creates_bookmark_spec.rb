require 'rails_helper'

feature 'User creates bookmark' do

  before do
    @user  = create(:user)
    @user2 = create(:user, email: 'jane@example.com')
    visit '/'
    user_login
    add_bookmark_to_Shoes_topic
  end

  scenario 'successfully' do
    expect(page).to have_content('Christian Louboutins')
  end

  scenario 'unsuccesfully without an account' do
    log_out
    visit '/topics/1'
    expect(page).to_not have_link('New bookmark')
  end

  scenario 'that can be updated successfully' do
    expect(page).to have_link('edit')
  end

  scenario 'that can not be updated by another user' do
    log_out
    user2_login
    click_link 'Shoes'
    expect(page).to_not have_link('edit')
  end

  scenario 'that can be deleted successfully' do
    click_link 'edit'

    within('.bookmark') do
      expect(page).to have_link('delete')
      click_link('delete')
    end

    expect(page).to_not have_content('Christian Louboutins')

  end

end