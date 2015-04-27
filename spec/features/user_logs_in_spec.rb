require 'rails_helper'

feature 'User logs in' do

  before do
    @user = create(:user)
  end

  scenario 'successfully' do
    click_log_in
    fill_login_credentials(@user)
    expect(page).to have_content("Signed in successfully.")
  end
  
end