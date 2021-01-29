require 'rails_helper'

feature 'XCLASS UPDATE', %q{
  Author xclass try edit
  Is not author try edit
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }
  given!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
  given!(:xclass) { create(:xclass, xcategory: xcategory, user: user) }

  scenario 'Author xclass try edit' do
    sign_in(user)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    find(:css, ".btn-outline-warning").click

    fill_in "Name",  with: "New xclass name"
    fill_in "Description", with: "New xclass description"
    click_on 'Update Xclass'

    expect(current_path).to eq xroot_xcategory_xclass_path(xroot, xcategory, Xclass.last)
    expect(page).to have_content "Xclass was successfully updated."
    expect(page).to have_content "New xclass name"
    expect(page).to have_content "New xclass description"
  end

  scenario 'Is not author try edit' do
    sign_in(user2)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    expect(page).to_not have_link('.btn-outline-warning', exact: true)
  end
end