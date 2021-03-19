require 'rails_helper'

feature 'XCLASS DESTROY', %q{
  Authenticated user destroy
  Unauthenticated user destroy
  Is not author try destroy
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given(:xroot) { create(:xroot, user: user) }
  given(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
  given(:xclass) { create(:xclass, xcategory: xcategory, user: user) }

  scenario 'Authenticated user destroy' do
    sign_in(user)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    find(:css, ".btn-danger").click

    expect(page).to have_content 'Xclass was successfully destroyed.'
  end

  scenario 'Unauthenticated user destroy' do
    sign_in(user2)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    expect(page).to_not have_link('.btn-outline-danger', exact: true)
  end
end