require 'rails_helper'

feature 'XCLASS UPDATE', '
  Author edit
  Not author try edit
' do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }
  given!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
  given!(:xclass) { create(:xclass, xcategory: xcategory, user: user) }

  scenario 'Author edit' do
    sign_in(user)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    find(:css, '.btn-outline-warning').click

    fill_in 'Title',  with: 'NewString'
    fill_in 'Description', with: 'NewText'
    click_on 'Update Xclass'

    expect(page).to have_content 'Xclass was successfully updated.'
    expect(page).to have_content 'NewString'
    expect(page).to have_content 'NewText'
  end

  scenario 'Not author try edit' do
    sign_in(user2)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    expect(page).to_not have_link('.btn-outline-warning', exact: true)
  end
end
