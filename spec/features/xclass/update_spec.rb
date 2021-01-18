require 'rails_helper'

feature 'XCLASS UPDATE', %q{
  Author xclass try edit
  Is not author try edit
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }
  given!(:xcategory) { create(:xcategory, xroot_id: xroot.id, user: user) }
  given!(:xclass) { create(:xclass, xcategory_id: xcategory.id, user: user) }
 
  scenario 'Author xclass try edit', js: true do
    sign_in(user)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    find(".fa-pencil").click
    fill_in "Name",  with: "New xclass name"
    fill_in "Description", with: "New xclass description"
    click_on 'Save xclass'

    expect(page).to have_content "New xclass name"
    expect(page).to have_content "New xclass description"
  end

  scenario 'Is not author try edit', js: true do
    sign_in(user2)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)
    
    expect(page).to_not have_link find(".fa-pencil")
  end
end