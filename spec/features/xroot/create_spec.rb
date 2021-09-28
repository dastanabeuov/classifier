require 'rails_helper'

feature 'XROOT CREATE', '
  Authenticated user create
  Authenticated user create with errors
' do

  given(:user) { create(:user) }
  given(:guest) { create(:user) }

  scenario 'Authenticated user create' do
    sign_in(user)
    visit xroots_path

    find(:css, '.btn-outline-success').click
    
    fill_in 'xroot[title]', with: 'MyString'
    fill_in 'xroot[description]', with: 'MyText'
    click_on 'Create Xroot'

    expect(page).to have_content 'Xroot was successfully created.'
    expect(page).to have_content 'MyString'
    expect(page).to have_content 'MyText'
  end

  scenario 'Authenticated user create with errors' do
    sign_in(user)
    visit xroots_path

    find(:css, '.btn-outline-success').click
    click_on 'Create Xroot'

    expect(page).to have_content "Xroot could not be created."
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Title is too short (minimum is 2 characters)"
  end

  context 'Multiple session' do
    scenario "Appears on another user's page xroot." do
      Capybara.using_session('user') do
        sign_in(user)
        visit new_xroot_path
      end

      Capybara.using_session('guest') do
        sign_in(guest)
        visit xroots_path
      end

      Capybara.using_session('user') do
        fill_in 'xroot[title]', with: 'MyString'
        fill_in 'xroot[description]', with: 'MyText'
        find(:css, '.btn-outline-success').click

        expect(page).to have_content 'Xroot was successfully created.'
        expect(page).to have_content 'MyString'
        expect(page).to have_content 'MyText'
      end

      Capybara.using_session('guest') do
        visit xroots_path

        expect(page).to have_content 'MyString'
      end
    end
  end
end
