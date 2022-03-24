# frozen_string_literal: true

require 'rails_helper'

feature 'XROOT DESTROY', %q(
  Author destroy
  Not author try destroy
) do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:xroot) { create(:xroot, user: user) }

  it 'Author destroy' do
    sign_in(user)
    visit xroot_path(xroot)

    find(:css, '.btn-outline-danger').click

    expect(page).to have_content 'Xroot was successfully destroyed.'
  end

  it 'Not author try destroy' do
    sign_in(user2)
    visit xroot_path(xroot)

    expect(page).not_to have_link('.btn-outline-danger', exact: true)
  end
end
