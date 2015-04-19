module FeatureSpecHelper

  RSpec.configure do |config|
    # Configure Rspec to include the module in feature specs:
    config.include FeatureSpecHelper, type: :feature
  end

  #   =====================   LOG IN   =====================   #
  #   ======================================================   #

  def fill_out_credentials
    within 'form' do
      fill_in( 'Name', with: @user.name )
      fill_in( 'Email', with: @user.email )
      fill_in( 'Password', with: @user.password )
      fill_in( 'Password confirmation', with: @user.password )
      click_button 'Sign up'  
    end
  end

  def fill_out_incorrect_credentials
    within 'form' do
      fill_in( 'Name', with: @user.name )
      fill_in( 'Email', with: @user.email )
      fill_in( 'Password', with: @user.password )
      fill_in( 'Password confirmation', with: '' )
      click_button 'Sign up'  
    end
  end

  def click_log_in
    visit '/' 
    click_link 'Log in' 
  end

  def fill_login_credentials(user)
    within 'form' do
      fill_in( 'Email', with: user.email )
      fill_in( 'Password', with: user.password )
      click_on 'Log in'
    end
  end

  def log_out
    click_link 'Log out'
  end

  #   =========   Dependent methods   =========   #

  def user_login(user)
    click_log_in
    fill_login_credentials(user)
  end

  #   =====================   TOPICS   =====================   #
  #   ======================================================   #
  def add_topic
    click_link 'Add Topic' 
    within 'form'  do
      fill_in( 'Title', with: 'Shoes' )
      fill_in( 'Description', with: 'Shoes of desire' )
      click_button 'save' 
    end
  end

  #   =====================  Bookmarks =====================   #
  #   ======================================================   #

  def add_bookmark_to_shoes_topic
    add_topic
    click_link 'Shoes'
    click_link 'New bookmark'
    within 'form' do
      fill_in( 'Url', with: 'http://eu.christianlouboutin.com/uk_en/shop/women/so-kate-patent.html' )
      fill_in('Title', with: 'Christian Louboutins')
      click_button 'Create Bookmark' 
    end
  end

end