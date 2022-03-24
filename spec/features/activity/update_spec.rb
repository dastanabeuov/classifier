# frozen_string_literal: true

require 'rails_helper'

feature 'ACTIVITY UPDATE', %q(
  Author edit
  Not author try edit
) do

  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:activity) { create(:activity, user: user) }

  it 'Author edit' do
    sign_in(user)
    visit activity_path(activity)

    find(:css, '.btn-outline-warning').click
    fill_in 'Title', with: 'NewString'
    fill_in 'Description', with: 'NewText'
    click_on 'Update Activity'

    expect(page).to have_content 'Activity was successfully updated.'
    expect(page).to have_content 'NewString'
    expect(page).to have_content 'NewText'
  end

  it 'Not author try edit' do
    sign_in(user2)
    visit activity_path(activity)

    expect(page).not_to have_link('btn-outline-warning', exact: true)
  end
end
