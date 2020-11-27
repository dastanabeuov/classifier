require 'rails_helper'

feature 'PROPERTY CREATE', %q{
  Authenticated user create property
  Authenticated user create property with errors
} do

  given(:user) { create(:user) }
  given!(:property) { create(:property) }

  scenario 'Authenticated user create property', js: true do
    sign_in(user)
    visit property_path(property)

    fill_in 'Name', with: 'My property'
    click_on 'Create property'

    expect(current_path).to eq property_path(property)
    expect(page).to have_content 'My property'
  end

  scenario 'Authenticated user create property with errors', js: true do
    sign_in(user)
    visit property_path(property)

    click_on 'Create property'

    expect(page).to have_content "Name can't be blank"
  end
end