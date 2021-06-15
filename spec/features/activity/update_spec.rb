require 'rails_helper'

feature 'ACTIVITY UPDATE', '
  Author activity try edit
  Is not author try edit
' do
  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:activity) { create(:activity, user: user) }

  scenario 'Author activity try edit' do
    sign_in(user)
    visit activity_path(activity)

    find(:css, '.btn-warning').click
    fill_in 'Name',  with: 'New activity name'
    fill_in 'Description', with: 'New activity description'
    click_on 'Update Activity'

    expect(current_path).to eq activity_path(activity)
    expect(page).to have_content 'Activity was successfully updated.'
    expect(page).to have_content 'New activity name'
    expect(page).to have_content 'New activity description'
  end

  scenario 'Is not author try edit' do
    sign_in(user2)
    visit activity_path(activity)

    expect(page).to_not have_link 'Edit question'
  end
end
