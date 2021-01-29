require 'rails_helper'

feature 'ACTIVITY CREATE', %q{
  Authenticated user create
  Authenticated user creates with errors
} do

  given(:user) { create(:user) }

  scenario 'Authenticated user create' do
    sign_in(user)
    visit activities_path

    find(:css, ".btn-outline-success").click
    fill_in 'Name', with: 'My activity'
    fill_in 'Description', with: 'My text'
    click_on 'Create Activity'

    expect(current_path).to eq activity_path(Activity.last)
    expect(page).to have_content "Activity was successfully created."
    expect(page).to have_content 'My activity'
  end

  scenario 'Authenticated user creates with errors' do
    sign_in(user)
    visit activities_path

    find(:css, ".btn-outline-success").click
    click_on 'Create Activity'

    expect(page).to have_content "Name can't be blank"
  end
end