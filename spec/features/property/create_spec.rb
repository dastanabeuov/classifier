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

    fill_in 'Name', with: 'My property'
    click_on 'Create property'

    expect(current_path).to eq property_path(property)
    within '.propertys' do # чтобы убедиться, что property в списке, а не в форме
      expect(page).to have_content 'My property'
    end
  end

  scenario 'Authenticated user creates property with errors', js: true do
    sign_in(user)
    visit property_path(property)

    click_on 'Create property'

    expect(page).to have_content "Name can't be blank"
  end
end