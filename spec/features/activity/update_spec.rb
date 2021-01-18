require 'rails_helper'

feature 'ACTIVITY UPDATE', %q{
  Author activity try edit
  Is not author try edit
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:activity) { create :activity, user: user }
 
  scenario 'Author activity try edit', js: true do
    sign_in(user)
    visit activity_path(activity)

    click_on 'Edit activity'
    fill_in "Name",  with: "New activity name"
    fill_in "Description", with: "New activity description"
    click_on 'Save activity'

    expect(page).to have_content "New activity name"
    expect(page).to have_content "New activity description"
  end

  scenario 'Is not author try edit', js: true do
    sign_in(user2)
    visit activity_path(activity)
    
    expect(page).to_not have_link 'Edit question'
  end
end