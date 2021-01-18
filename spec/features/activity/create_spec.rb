require 'rails_helper'

feature 'ACTIVITY CREATE', %q{
  Authenticated user create activity
  Authenticated user creates activity with errors
} do

  given(:user) { create(:user) }

  scenario 'Authenticated user create activity', js: true do
    sign_in(user)
    visit new_activity_path

    fill_in 'Name', with: 'My activity'
    fill_in 'Description', with: 'My text'
    click_on 'Create activity'

    expect(current_path).to eq activity_path(activity)
    expect(page).to have_content 'My activity'
  end

  scenario 'Authenticated user creates activity with errors', js: true do
    sign_in(user)
    visit new_activity_path

    click_on 'Create activity'

    expect(page).to have_content "Name can't be blank"
  end
end