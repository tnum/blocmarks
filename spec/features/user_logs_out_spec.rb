require 'rails_helper'

feature 'User logs out' do

  before do
    @user = create(:user)
    click_log_in
    fill_login_credentials
  end

  scenario 'successfully' do
    click_link 'Log out' 
    expect(page).to have_content('Signed out successfully.')
  end
  
end
