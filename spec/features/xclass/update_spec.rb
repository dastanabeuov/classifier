require 'rails_helper'

feature 'xclass update', %q{
  Authenticated user can able to update xclass
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xclass) { create :xclass, user: user }
 
  scenario 'Author xclass try edit', js: true do
    sign_in(user)
    visit question_path(question)

    click_on 'Edit xclass'
    within '.question' do
      fill_in "Name",  with: "New xclass name"
      fill_in "Description", with: "New xclass description"
      click_on 'Save xclass'

      expect(page).to have_content "New xclass name"
      expect(page).to have_content "New xclass description"
      expect(page).to_not have_selector 'textarea'
    end
  end

  scenario 'User is not author try edit', js: true do
    sign_in(user2)
    visit xclass_path(xclass)
    
    expect(page).to_not have_link 'Edit question'
  end
end