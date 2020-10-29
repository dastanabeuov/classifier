require 'rails_helper'

feature 'User can give an xroot', %q{
  In order to share my knowledge
  As an authenticated user
  I want to be able to create xroot
} do

  given(:user) { create(:user) }
  given!(:xroot) { create(:xroot) }

  scenario 'Authenticated user create xroot', js: true do
    sign_in(user)
    visit xroot_path(xroot)

    fill_in 'Name', with: 'My xroot'
    click_on 'Create xroot'

    expect(current_path).to eq xroot_path(xroot)
    within '.xroots' do # чтобы убедиться, что xroot в списке, а не в форме
      expect(page).to have_content 'My xroot'
    end
  end

  scenario 'Authenticated user creates xroot with errors', js: true do
    sign_in(user)
    visit xroot_path(xroot)

    click_on 'Create xroot'

    expect(page).to have_content "Name can't be blank"
  end
end