require 'rails_helper'

feature 'XROOT CREATE', %q{
  Authenticated user create xroot
  Authenticated user create xroot with errors
} do

  given(:user) { create(:user) }

  scenario 'Authenticated user create xroot' do
    sign_in(user)
    visit xroots_path

    # save_and_open_page

    find(:css, ".btn-success").click

    within find('.xroot') do
      fill_in 'Name', with: 'My xroot'
      fill_in 'Description', with: 'My text'
    end
    click_on 'Create Xroot'

    expect(current_path).to eq xroot_path(Xroot.last)
    expect(page).to have_content 'Xroot was successfully created.'
    expect(page).to have_content 'My xroot'
    expect(page).to have_content 'My text'
  end

  scenario 'Authenticated user create xroot with errors' do
    sign_in(user)
    visit xroots_path

    find(:css, ".btn-success").click
    click_on 'Create Xroot'

    expect(page).to have_content "Name can't be blank"
  end
end