require 'rails_helper'

feature 'XROOT CREATE', '
  Authenticated user create xroot
  Authenticated user create xroot with errors
' do
  given(:user) { create(:user) }

  scenario 'Authenticated user create xroot' do
    sign_in(user)
    visit xroots_path

    # save_and_open_page

    find(:css, '.btn-success').click

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

    find(:css, '.btn-success').click
    click_on 'Create Xroot'

    expect(page).to have_content "Name can't be blank"
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
        fill_in 'Name', with: 'MyString'
        fill_in 'Description', with: 'MyText'
        click_on 'Save xroot'

        expect(page).to have_content 'MyString'
        expect(page).to have_content 'MyText'
      end

      Capybara.using_session('guest') do
        expect(page).to have_content 'MyString'
      end
    end
  end
end
