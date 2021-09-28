require 'rails_helper'

feature 'XROOT DESTROY', '
  Author destroy
  Not author try destroy
' do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given(:xroot) { create(:xroot, user: user) }

  scenario 'Author destroy' do
    sign_in(user)
    visit xroot_path(xroot)

    find(:css, '.btn-outline-danger').click

    expect(page).to have_content 'Xroot was successfully destroyed.'
  end

  scenario 'Not author try destroy' do
    sign_in(user2)
    visit xroot_path(xroot)

    expect(page).to_not have_link('.btn-outline-danger', exact: true)
  end
end
