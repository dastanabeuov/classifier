require 'rails_helper'

feature 'XROOT CREATE', %q{
  Authenticated user create xroot
  Authenticated user create xroot with errors
} do

  given(:user) { create(:user) }

  scenario 'Authenticated user create xroot', js: true do
    login(user)
    visit new_xroot_path

    fill_in 'Name', with: 'My xroot'
    fill_in 'Description', with: 'My text'
    click_on 'Create xroot'

    expect(current_path).to eq xroot_path(xroot)
    expect(page).to have_content 'My xroot'
  end

  scenario 'Authenticated user create xroot with errors', js: true do
    login(user)
    visit xroot_path(xroot)

    click_on 'Create xroot'

    expect(page).to have_content "Name can't be blank"
  end
end