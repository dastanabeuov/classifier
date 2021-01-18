require 'rails_helper'

feature 'PROPERTY CREATE', %q{
  Authenticated user create property
  Authenticated user create property with errors
} do

  given(:user) { create(:user) }
  given!(:activity) { create(:activity, :user user) }
  given!(:xroot) { create(:xroot, :user user) }

  scenario 'Authenticated user create property', js: true do
    sign_in(user)
    visit new_property_path

    fill_in 'Name', with: 'My property'
    fill_in 'Description', with: 'My text'
    fill_in 'Activity', with: activity.id
    fill_in 'Propertyable', with: xroot.id
    click_on 'Create property'

    expect(current_path).to eq property_path(property)
    expect(page).to have_content 'My property'
  end

  scenario 'Authenticated user create property with errors', js: true do
    sign_in(user)
    visit new_property_path

    click_on 'Create property'

    expect(page).to have_content "Name can't be blank"
  end
end