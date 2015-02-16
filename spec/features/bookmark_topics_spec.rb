require 'rails_helper'

feature 'Bookmark topics' do

  before do
    visit(root_path)
    add_topic
  end

  scenario 'can be created and added to the home page index successfully' do
    expect(page).to have_content('Shoes')
  end

  scenario 'can be updated or deleted successfully' do
    expect(page).to have_link('edit')
  end

end