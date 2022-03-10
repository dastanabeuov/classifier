# frozen_string_literal: true

require 'rails_helper'

describe 'XCLASS DESTROY', '
  Author destroy
  Not author try destroy
' do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:xroot) { create(:xroot, user: user) }
  let(:xcategory) { create(:xcategory, xroot: xroot, user: user) }
  let(:xclass) { create(:xclass, xcategory: xcategory, user: user) }

  it 'Author destroy' do
    sign_in(user)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    find(:css, '.btn-outline-danger').click

    expect(page).to have_content 'Xclass was successfully destroyed.'
  end

  it 'Not author try destroy' do
    sign_in(user2)
    visit xroot_xcategory_xclass_path(xroot, xcategory, xclass)

    expect(page).not_to have_link('.btn-outline-danger', exact: true)
  end
end
