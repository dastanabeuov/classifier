require 'rails_helper'

feature 'XROOT UPDATE', %q{
  Author xroot try edit
  Not author try edit
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }

  scenario 'Author xroot try edit' do
    sign_in(user)
    visit xroots_path

    find(:css, ".btn-outline-warning").click

    fill_in "Name", with: "New xroot name"
    fill_in "Description", with: "New xroot description"
    click_on "Update Xroot"
    
    expect(current_path).to eq xroot_path(xroot)
    expect(page).to have_content "Xroot was successfully updated."
    expect(page).to have_content "New xroot name"
    expect(page).to have_content "New xroot description"
  end

  scenario 'Not author try edit' do
    sign_in(user2)
    visit xroots_path

    expect(page).to_not have_link('.btn-outline-warning', exact: true)
  end
end