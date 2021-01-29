require 'rails_helper'

feature 'XCATEGORY CREATE', %q{
  Authenticated user create
  Authenticated user create with errors
} do

  given(:user) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }

  scenario 'Authenticated user create xcategory' do
    sign_in(user)
    visit new_xroot_xcategory_path(xroot)

    within find('.xcategory') do
      fill_in 'Name', with: 'My xcategory'
      fill_in 'Description', with: 'My text'
    end
    click_on 'Create Xcategory'

    expect(current_path).to eq xroot_xcategory_path(xroot, Xcategory.last)
    expect(page).to have_content "Xcategory was successfully created."
    expect(page).to have_content 'My xcategory'
  end

  scenario 'Authenticated user create with errors' do
    sign_in(user)
    visit new_xroot_xcategory_path(xroot)

    click_on 'Create Xcategory'

    expect(page).to have_content "Name can't be blank"
  end
end