require 'rails_helper'

feature 'XCLASS CREATE', '
  Authenticated user create
  Authenticated user create with errors
' do
  given(:user) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }
  given!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

  scenario 'Authenticated user create' do
    sign_in(user)
    visit new_xroot_xcategory_xclass_path(xroot, xcategory)

    within find('.xclass') do
      fill_in 'Name', with: 'My xclass'
      fill_in 'Description', with: 'My text'
    end
    click_on 'Create Xclass'

    expect(current_path).to eq xroot_xcategory_xclass_path(xroot, xcategory, Xclass.last)
    expect(page).to have_content 'Xclass was successfully created.'
    expect(page).to have_content 'My xclass'
  end

  scenario 'Authenticated user create with errors' do
    sign_in(user)
    visit new_xroot_xcategory_xclass_path(xroot, xcategory)

    find(:css, '.btn-success').click
    click_on 'Create Xclass'

    expect(page).to have_content "Name can't be blank"
  end
end
