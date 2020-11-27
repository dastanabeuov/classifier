require 'rails_helper'

feature 'XROOT UPDATE', %q{
  Author xroot try edit
  Not author try edit
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }

  scenario 'Author xroot try edit', js: true do
    login(user)
    visit xroot_path(xroot)

    find(".fa-pencil").click
    within '.edit' do
      fill_in "Name",  with: "New xroot name"
      fill_in "Description", with: "New xroot description"
      click_on 'Save xroot'

      expect(page).to have_content "New xroot name"
      expect(page).to have_content "New xroot description"
      expect(page).to_not have_selector 'textarea'
    end
  end

  scenario 'Not author try edit', js: true do
    login(user2)
    visit xroot_path(xroot)
    
    expect(page).to_not have_link find(".fa-pencil")
  end
end