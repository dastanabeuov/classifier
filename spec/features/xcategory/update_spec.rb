require 'rails_helper'

feature 'XCATEGORY UPDATE', %q{
  Author xcategory try edit
  Is not author try edit
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }
  given!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
 
  scenario 'Author xcategory try edit' do
    sign_in(user)
    visit xroot_xcategory_path(xroot, xcategory)

    find(:css, ".btn-warning").click

    fill_in "Name",  with: "New xcategory name"
    fill_in "Description", with: "New xcategory description"
    click_on 'Update Xcategory'

    expect(current_path).to eq xroot_xcategory_path(xroot, xcategory)
    expect(page).to have_content "Xcategory was successfully updated."
    expect(page).to have_content "New xcategory name"
    expect(page).to have_content "New xcategory description"
  end

  scenario 'Is not author try edit' do
    sign_in(user2)
    visit xroot_xcategory_path(xroot, xcategory)
    
    expect(page).to_not have_link 'btn-outline-warning'
  end
end