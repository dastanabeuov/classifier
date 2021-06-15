require 'rails_helper'

feature 'XCATEGORY CREATE', '
  Authenticated user create
  Authenticated user create with errors
' do
  given(:user) { create(:user) }
  given!(:xroot) { create(:xroot, user: user) }

  scenario 'Authenticated user create xcategory' do
    sign_in(user)
    visit new_xroot_xcategory_path(xroot)

    within find('.xcategory') do
      fill_in 'Name', with: 'My xcategory'
      fill_in 'Description', with: 'My text'
    end
    click_on 'Create Xcategory'

    expect(current_path).to eq xroot_xcategory_path(xroot, Xcategory.last)
    expect(page).to have_content 'Xcategory was successfully created.'
    expect(page).to have_content 'My xcategory'
  end

  scenario 'Authenticated user create with errors' do
    sign_in(user)
    visit new_xroot_xcategory_path(xroot)

    click_on 'Create Xcategory'

    expect(page).to have_content "Name can't be blank"
  end

  context 'Multiple session' do
    scenario "Appears on another user's page xcategory." do
      Capybara.using_session('user') do
        sign_in(user)
        visit new_xroot_xcategory_path(xroot)
      end

      Capybara.using_session('guest') do
        sign_in(guest)
        visit xroot_path(xroot)
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
