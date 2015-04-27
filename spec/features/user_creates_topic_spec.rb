require 'rails_helper'

feature 'User creates topics' do

  before do
    @user  = create(:user)
    @user2 = create(:user, email: 'jane@example.com')
    visit '/'
  end

  scenario 'successfully' do
    user_login(@user)
    add_topic
    expect(page).to have_content('Shoes')
  end

  scenario 'unsuccessfully if not logged in' do
    expect(page).to_not have_link('Add Topic')
  end

  scenario 'that can be updated successfully' do
    user_login(@user)
    add_topic
    expect(page).to have_content('edit')
  end

  scenario 'that can not be edited by other users' do
    user_login(@user)
    add_topic
    expect(page).to have_link('edit')
    log_out

    user_login(@user2)
    expect(page).to have_content('Shoes')
    expect(page).to_not have_link('edit')
  end

  scenario 'that can be deleted successfully', js: true do
    user_login(@user)
    add_topic
    expect(page).to have_content('Shoes')

    click_link 'edit'
    expect(page).to have_link('delete')

    click_link 'delete'
    # page.evaluate_script('window.confirm = function() { return true; }')
    # expect(page).to have_content('Are you sure?')
    
    # click_link 'yes'
    expect(current_path).to eq('/')
    expect(page).to_not have_content('Shoes')
  end

  scenario 'that can not be deleted by another user' do
    user_login(@user)
    add_topic
    click_link 'edit'
    expect(page).to have_link('delete')
    log_out

    user_login(@user2)
  end

end