require 'rails_helper'

feature 'property update', %q{
  Authenticated user can able to update property
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:property) { create :property, user: user }
 
  scenario 'Author property try edit', js: true do
    sign_in(user)
    visit question_path(question)

    click_on 'Edit property'
    within '.question' do
      fill_in "Name",  with: "New property name"
      fill_in "Description", with: "New property description"
      click_on 'Save property'

      expect(page).to have_content "New property name"
      expect(page).to have_content "New property description"
      expect(page).to_not have_selector 'textarea'
    end
  end

  scenario 'User is not author try edit', js: true do
    sign_in(user2)
    visit property_path(property)
    
    expect(page).to_not have_link 'Edit question'
  end
end