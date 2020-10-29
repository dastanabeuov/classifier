require 'rails_helper'

feature 'xroot update', %q{
  Authenticated user can able to update xroot
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xroot) { create :xroot, user: user }
 
  scenario 'Author xroot try edit', js: true do
    sign_in(user)
    visit question_path(question)

    click_on 'Edit xroot'
    within '.question' do
      fill_in "Name",  with: "New xroot name"
      fill_in "Description", with: "New xroot description"
      click_on 'Save xroot'

      expect(page).to have_content "New xroot name"
      expect(page).to have_content "New xroot description"
      expect(page).to_not have_selector 'textarea'
    end
  end

  scenario 'User is not author try edit', js: true do
    sign_in(user2)
    visit xroot_path(xroot)
    
    expect(page).to_not have_link 'Edit question'
  end
end