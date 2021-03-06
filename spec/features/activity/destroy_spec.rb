require 'rails_helper'

feature 'ACTIVITY DESTROY', '
  Authenticated user destroy
  Unauthenticated user destroy
  Is not author try destroy
' do
  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:activity) { create(:activity, user: user) }

  scenario 'Authenticated user destroy' do
    sign_in(user)
    visit activities_path

    find(:css, '.btn-danger').click

    expect(current_path).to eq activities_path
    expect(page).to have_content 'Activity was successfully destroyed.'
  end

  scenario 'Unauthenticated user destroy' do
    sign_in(user)
    visit activities_path

    expect(page).to_not have_link('.btn-outline-danger', exact: true)
  end
end
