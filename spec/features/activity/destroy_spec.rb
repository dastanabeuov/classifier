# frozen_string_literal: true

require 'rails_helper'

feature 'ACTIVITY DESTROY', %q(
  Author destroy
  Not author try destroy
) do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:activity) { create(:activity, user: user) }

  it 'Author destroy' do
    sign_in(user)
    visit activities_path

    find(:css, '.btn-outline-danger').click

    expect(page).to have_current_path activities_path, ignore_query: true
    expect(page).to have_content 'Activity was successfully destroyed.'
  end

  it 'Not author try destroy' do
    sign_in(user)
    visit activities_path

    expect(page).not_to have_link('.btn-outline-danger', exact: true)
  end
end
