require 'rails_helper'

feature 'XCATEGORY DESTROY', '
  Authenticated user destroy
  Unauthenticated user destroy
  Is not author try destroy
' do
  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }
  given!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

  scenario 'Authenticated user destroy' do
    sign_in(user)
    visit xroot_xcategory_path(xroot, xcategory)

    find(:css, '.btn-danger').click

    expect(current_path).to eq xroot_path(xroot)
    expect(page).to have_content 'Xcategory was successfully destroyed.'
  end

  scenario 'Unauthenticated user destroy' do
    sign_in(user)
    visit xroot_xcategory_path(xroot, xcategory)

    expect(page).to_not have_link('.btn-outline-danger', exact: true)
  end
end
