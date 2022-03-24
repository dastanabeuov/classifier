# frozen_string_literal: true

require 'rails_helper'

feature 'XCATEGORY DESTROY', %q(
  Author destroy
  Not author try destroy
) do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:xroot) { create(:xroot, user: user) }
  let!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

  it 'Author destroy' do
    sign_in(user)
    visit xroot_xcategory_path(xroot, xcategory)

    find(:css, '.btn-outline-danger').click

    expect(page).to have_content 'Xcategory was successfully destroyed.'
  end

  it 'Not author try destroy' do
    sign_in(user2)
    visit xroot_xcategory_path(xroot, xcategory)

    expect(page).not_to have_link('.btn-outline-danger', exact: true)
  end
end
