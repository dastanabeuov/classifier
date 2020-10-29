require 'rails_helper'

feature 'User can give an xclass', %q{
  In order to share my knowledge
  As an authenticated user
  I want to be able to create xclass
} do

  given(:user) { create(:user) }
  given!(:xclass) { create(:xclass) }

  scenario 'Authenticated user create xclass', js: true do
    sign_in(user)
    visit xclass_path(xclass)

    fill_in 'Name', with: 'My xclass'
    click_on 'Create Xclass'

    expect(current_path).to eq xclass_path(xclass)
    within '.xclasss' do # чтобы убедиться, что xclass в списке, а не в форме
      expect(page).to have_content 'My xclass'
    end
  end

  scenario 'Authenticated user creates xclass with errors', js: true do
    sign_in(user)
    visit xclass_path(xclass)

    click_on 'Create Xclass'

    expect(page).to have_content "Name can't be blank"
  end
end