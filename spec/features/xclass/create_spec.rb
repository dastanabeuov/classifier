# frozen_string_literal: true

require 'rails_helper'

feature 'XCLASS CREATE', '
  Authenticated user create
  Authenticated user create with errors
' do
  given(:user) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }
  given!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

  scenario 'Authenticated user create xclass' do
    sign_in(user)
    visit new_xroot_xcategory_xclass_path(xroot, xcategory)

    within find('.xclass') do
      fill_in 'xclass[title]', with: 'MyString'
      fill_in 'xclass[description]', with: 'MyText'
    end

    click_on 'Create Xclass'

    expect(page).to have_content 'Xclass was successfully created.'
    expect(page).to have_content 'MyString'
    expect(page).to have_content 'MyText'
  end

  scenario 'Authenticated user create with errors' do
    sign_in(user)
    visit new_xroot_xcategory_xclass_path(xroot, xcategory)

    find(:css, '.btn-outline-success').click
    click_on 'Create Xclass'

    expect(page).to have_content 'Xclass could not be created.'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content 'Title is too short (minimum is 2 characters)'
  end
end
