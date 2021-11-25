# frozen_string_literal: true

require 'rails_helper'

feature 'ACTIVITY CREATE', '
  Authenticated user create
  Authenticated user creates with errors
' do
  given(:user) { create(:user) }

  scenario 'Authenticated user create' do
    sign_in(user)
    visit activities_path

    find(:css, '.btn-outline-success').click
    fill_in 'activity[title]', with: 'MyString'
    fill_in 'activity[description]', with: 'MyText'
    click_on 'Create Activity'

    expect(page).to have_content 'Activity was successfully created.'
    expect(page).to have_content 'MyString'
    expect(page).to have_content 'MyText'
  end

  scenario 'Authenticated user creates with errors' do
    sign_in(user)
    visit activities_path

    find(:css, '.btn-outline-success').click
    click_on 'Create Activity'

    expect(page).to have_content 'Activity could not be created.'
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content 'Title is too short (minimum is 2 characters)'
  end
end
