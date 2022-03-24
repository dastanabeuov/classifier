# frozen_string_literal: true

require 'rails_helper'

feature 'XCATEGORY UPDATE', %q(
  Author edit
  Not author try edit
) do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:xroot) { create(:xroot, user: user) }
  let!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

  it 'Author edit' do
    sign_in(user)
    visit xroot_xcategory_path(xroot, xcategory)

    find(:css, '.btn-outline-warning').click

    fill_in 'Title', with: 'NewString'
    fill_in 'Description', with: 'NewText'
    click_on 'Update Xcategory'

    expect(page).to have_content 'Xcategory was successfully updated.'
    expect(page).to have_content 'NewString'
    expect(page).to have_content 'NewText'
  end

  it 'Not author try edit' do
    sign_in(user2)
    visit xroot_xcategory_path(xroot, xcategory)

    expect(page).not_to have_link('btn-outline-warning', exact: true)
  end
end
