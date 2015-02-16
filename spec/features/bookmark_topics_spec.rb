require 'rails_helper'

feature 'Bookmark topics' do

  scenario 'can be created and added to the home page index successfully' do
    visit(root_path)
    add_topic
    expect(page).to have_content('Shoes')
  end

  scenario 'can be updated or deleted successfully' do
    topic = create(:topic)
    expect(page).to have_link('Edit')
  end

end