require 'rails_helper'

feature 'XCATEGORY DESTROY', '
  Author destroy
  Not author try destroy
' do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }
  given!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

  scenario 'Author destroy' do
    sign_in(user)
    visit xroot_xcategory_path(xroot, xcategory)

    find(:css, '.btn-outline-danger').click

    expect(page).to have_content 'Xcategory was successfully destroyed.'
  end

  scenario 'Not author try destroy' do
    sign_in(user2)
    visit xroot_xcategory_path(xroot, xcategory)

    expect(page).to_not have_link('.btn-outline-danger', exact: true)
  end
end
