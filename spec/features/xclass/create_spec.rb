require 'rails_helper'

feature 'XCLASS CREATE', %q{
  Authenticated user create xclass
  Authenticated user create xclass with errors
} do

  given(:user) { create(:user) }

  given!(:xroot) { create(:xroot, user: user) }
  given!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
  given!(:xclass) { create(:xclass, xcategory: xcategory, user: user) }

  scenario 'Authenticated user create xclass', js: true do
    sign_in(user)
    visit new_xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    fill_in 'Name', with: 'My xclass'
    click_on 'Create Xclass'

    expect(current_path).to eq xclass_path(xclass)
    expect(page).to have_content 'My xclass'
  end

  scenario 'Authenticated user create xclass with errors', js: true do
    sign_in(user)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    click_on 'Create Xclass'

    expect(page).to have_content "Name can't be blank"
  end
end