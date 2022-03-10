# frozen_string_literal: true

require 'rails_helper'

describe 'XCLASS UPDATE', '
  Author edit
  Not author try edit
' do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:xroot) { create(:xroot, user: user) }
  let!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
  let!(:xclass) { create(:xclass, xcategory: xcategory, user: user) }

  it 'Author edit' do
    sign_in(user)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    find(:css, '.btn-outline-warning').click

    fill_in 'Title', with: 'NewString'
    fill_in 'Description', with: 'NewText'
    click_on 'Update Xclass'

    expect(page).to have_content 'Xclass was successfully updated.'
    expect(page).to have_content 'NewString'
    expect(page).to have_content 'NewText'
  end

  it 'Not author try edit' do
    sign_in(user2)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    expect(page).not_to have_link('.btn-outline-warning', exact: true)
  end
end
