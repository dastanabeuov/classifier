require 'rails_helper'

feature 'User can give an property', %q{
  In order to share my knowledge
  As an authenticated user
  I want to be able to create property
} do

  given(:user) { create(:user) }
  given!(:property) { create(:property) }

  scenario 'Authenticated user create property', js: true do
    sign_in(user)
    visit property_path(property)

    fill_in 'Content', with: 'My content'
    click_on 'Create Property'

    expect(current_path).to eq property_path(property)
    within '.propertys' do # чтобы убедиться, что property в списке, а не в форме
      expect(page).to have_content 'My root'
    end
  end

  scenario 'Authenticated user creates property with errors', js: true do
    sign_in(user)
    visit property_path(property)

    click_on 'Create Property'

    expect(page).to have_content "Content can't be blank"
  end
end