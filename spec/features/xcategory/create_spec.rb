require 'rails_helper'

feature 'User can create xcategory', %q{
  Authenticated user can able to create xcategory
} do

  given(:user) { create(:user) }
  given!(:xcategory) { create(:xcategory) }

  scenario 'Authenticated user create xcategory', js: true do
    sign_in(user)
    visit xcategory_path(xcategory)

    fill_in 'Name', with: 'My xcategory'
    click_on 'Create Xcategory'

    expect(current_path).to eq xcategory_path(xcategory)
    within '.xcategories' do # чтобы убедиться, что xcategory в списке, а не в форме
      expect(page).to have_content 'My xcategory'
    end
  end

  scenario 'Authenticated user creates xcategory with errors', js: true do
    sign_in(user)
    visit xcategory_path(xcategory)

    click_on 'Create Xcategory'

    expect(page).to have_content "Name can't be blank"
  end
end