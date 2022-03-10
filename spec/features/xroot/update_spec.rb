# frozen_string_literal: true

require 'rails_helper'

describe 'XROOT UPDATE', '
  Author edit
  Not author try edit
' do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:xroot) { create(:xroot, user: user) }

  it 'Author edit' do
    sign_in(user)
    visit edit_xroot_path(xroot)

    fill_in 'Title', with: 'New xroot title'
    fill_in 'Description', with: 'New xroot description'
    click_on 'Update Xroot'

    expect(page).to have_current_path xroot_path(xroot), ignore_query: true
    expect(page).to have_content 'Xroot was successfully updated.'
    expect(page).to have_content 'New xroot title'
    expect(page).to have_content 'New xroot description'
  end

  it 'Not author try edit' do
    sign_in(user2)
    visit xroot_path(xroot)

    expect(page).not_to have_link('.btn-outline-warning', exact: true)
  end
end
