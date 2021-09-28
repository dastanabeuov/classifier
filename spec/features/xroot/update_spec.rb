require 'rails_helper'

feature 'XROOT UPDATE', '
  Author edit
  Not author try edit
' do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }

  scenario 'Author edit' do
    sign_in(user)
    visit edit_xroot_path(xroot)

    fill_in 'Title', with: 'New xroot title'
    fill_in 'Description', with: 'New xroot description'
    click_on 'Update Xroot'

    expect(current_path).to eq xroot_path(xroot)
    expect(page).to have_content 'Xroot was successfully updated.'
    expect(page).to have_content 'New xroot title'
    expect(page).to have_content 'New xroot description'
  end

  scenario 'Not author try edit' do
    sign_in(user2)
    visit xroot_path(xroot)

    expect(page).to_not have_link('.btn-outline-warning', exact: true)
  end
end
