# frozen_string_literal: true

require 'rails_helper'

feature 'XCATEGORY CREATE', %q(
  Authenticated user create
  Authenticated user create with errors
) do

  let(:user) { create(:user) }
  let(:guest) { create(:user) }
  let!(:xroot) { create(:xroot, user: user) }

  it 'Authenticated user create' do
    sign_in(user)
    visit new_xroot_xcategory_path(xroot)

    within find('.xcategory') do
      fill_in 'xcategory[title]', with: 'MyString'
      fill_in 'xcategory[description]', with: 'MyText'
    end
    click_on 'Create Xcategory'

    expect(page).to have_content 'Xcategory was successfully created.'
    expect(page).to have_content 'MyString'
    expect(page).to have_content 'MyText'
  end

  it 'Authenticated user create with errors' do
    sign_in(user)
    visit new_xroot_xcategory_path(xroot)

    click_on 'Create Xcategory'

    expect(page).to have_content 'Xcategory could not be created.'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content 'Title is too short (minimum is 2 characters)'
  end
end
