require 'rails_helper'

feature 'XCATEGORY CREATE', %q{
  Authenticated user create xcategory
  Authenticated user create xcategory with errors
} do

  given(:user) { create(:user) }
  given!(:xroot) { create(:xroot, :user user) }

  scenario 'Authenticated user create xcategory', js: true do
    sign_in(user)
    visit new_xroot_xcategory_path(xroot)

    fill_in 'Name', with: 'My xcategory'
    fill_in 'Description', with: 'My text'
    click_on 'Create Xcategory'

    expect(current_path).to eq xroot_xcategory_path(xroot, xcategory)
    expect(page).to have_content 'My xcategory'
  end

  scenario 'Authenticated user create xcategory with errors', js: true do
    sign_in(user)
    visit new_xroot_xcategory_path(xroot)

    click_on 'Create Xcategory'

    expect(page).to have_content "Name can't be blank"
  end
end