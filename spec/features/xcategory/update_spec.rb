require 'rails_helper'

feature 'Xcategory update', %q{
  Authenticated user can able to update xcategory
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xcategory) { create :xcategory, user: user }
 
  scenario 'Author xcategory try edit', js: true do
    sign_in(user)
    visit question_path(question)

    click_on 'Edit Xcategory'
    within '.question' do
      fill_in "Name",  with: "New xcategory name"
      fill_in "Description", with: "New xcategory description"
      click_on 'Save Xcategory'

      expect(page).to have_content "New xcategory name"
      expect(page).to have_content "New xcategory description"
      expect(page).to_not have_selector 'textarea'
    end
  end

  scenario 'User is not author try edit', js: true do
    sign_in(user2)
    visit xcategory_path(xcategory)
    
    expect(page).to_not have_link 'Edit question'
  end
end