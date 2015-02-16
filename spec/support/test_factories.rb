def add_topic
  click_link('Add Topic')
  within('form') do
    fill_in('Title', with: 'Shoes')
    fill_in('Description', with: 'Shoes of desire')
    click_button('save')
  end
end