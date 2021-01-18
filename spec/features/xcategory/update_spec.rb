require 'rails_helper'

feature 'XCATEGORY UPDATE', %q{
  Author xcategory try edit
  Is not author try edit
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }
  given!(:xcategory) { create(:xcategory, :xroot_id xroot.id, user: user) }
 
  scenario 'Author xcategory try edit', js: true do
    sign_in(user)
    visit xroot_xcategory_path(xroot, xcategory)

    click_on 'Edit Xcategory'

    fill_in "Name",  with: "New xcategory name"
    fill_in "Description", with: "New xcategory description"
    click_on 'Save Xcategory'

    expect(page).to have_content "New xcategory name"
    expect(page).to have_content "New xcategory description"
  end

  scenario 'Is not author try edit', js: true do
    sign_in(user2)
    visit xroot_xcategory_path(xroot, xcategory)
    
    expect(page).to_not have_link 'Edit question'
  end
end