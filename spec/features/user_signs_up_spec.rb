require 'rails_helper'

feature 'User signs up' do

  before do
    @user = build(:user)
  end

  scenario 'successfully' do
    visit('/')
    click_link 'Sign up'
    fill_out_credentials
    expect(page).to have_content("Welcome John Smith")
  end

  scenario 'unsuccessfully' do
    visit('/')
    click_link 'Sign up'
    fill_out_incorrect_credentials
    expect(page).to have_content("error")
  end
  
end