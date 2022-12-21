# frozen_string_literal: true

require 'rails_helper'

feature 'XCLASS CREATE', %q(
  Authenticated user create
  Authenticated user create with errors
) do

  let(:user) { create(:user) }
  let!(:xroot) { create(:xroot, user: user) }
  let!(:xcategory) { create(:xcategory, xroot: xroot, user: user) }

  it 'Authenticated user create xclass' do
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

  it 'Authenticated user create with errors' do
    sign_in(user)
    visit new_xroot_xcategory_xclass_path(xroot, xcategory)

    find(:css, '.btn-outline-success').click
    click_on 'Create Xclass'

    expect(page).to have_content 'Xclass could not be created.'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content 'Title is too short (minimum is 2 characters)'
  end
end
