require 'rails_helper'

feature 'Bookmark topics' do

  scenario 'can be created and added to the home page index successfully' do
    visit(root_path)
    click_link('Add Topic')
    within('form') do
      fill_in('Title', with: 'Shoes')
      fill_in('Description', with: 'Shoes of desire')
      click_button('save')
    end
    expect(page).to have_content('Shoes')
  end

  scenario 'can be updated or deleted successfully' do
  end

end