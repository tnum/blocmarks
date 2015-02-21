def add_topic
  click_link 'Add Topic' 
  within 'form'  do
    fill_in( 'Title', with: 'Shoes' )
    fill_in( 'Description', with: 'Shoes of desire' )
    click_button 'save' 
  end
end

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

def fill_login_credentials
  within 'form' do
    fill_in( 'Email', with: @user.email )
    fill_in( 'Password', with: @user.password )
    click_on 'Log in'
  end
end