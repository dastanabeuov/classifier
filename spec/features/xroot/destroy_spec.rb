require 'rails_helper'

feature 'XROOT DESTROY', %q{
  Authenticated user destroy
  Unauthenticated user destroy
  Is not author try destroy
} do

  given(:user) { create(:user) }
  given(:user2) { create(:user) }
  given(:xroot) { create(:xroot, user: user) }

  scenario 'Authenticated user destroy' do
    sign_in(user)
    visit xroot_path(xroot)

    find(:css, ".btn-outline-danger").click

    expect(current_path).to eq xroots_path
    expect(page).to have_content 'Xroot was successfully destroyed.'
  end

  scenario 'Unauthenticated user destroy' do
    sign_in(user)
    visit xroots_path

    expect(page).to_not have_link('.btn-outline-danger', exact: true)
  end
end