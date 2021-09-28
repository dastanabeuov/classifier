require 'rails_helper'

feature 'ACTIVITY UPDATE', '
  Author edit
  Not author try edit
' do
  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:activity) { create(:activity, user: user) }

  scenario 'Author edit' do
    sign_in(user)
    visit activity_path(activity)

    find(:css, '.btn-outline-warning').click
    fill_in 'Title',  with: 'NewString'
    fill_in 'Description', with: 'NewText'
    click_on 'Update Activity'

    expect(page).to have_content 'Activity was successfully updated.'
    expect(page).to have_content 'NewString'
    expect(page).to have_content 'NewText'
  end

  scenario 'Not author try edit' do
    sign_in(user2)
    visit activity_path(activity)

    expect(page).to_not have_link('btn-outline-warning', exact: true)
  end
end
