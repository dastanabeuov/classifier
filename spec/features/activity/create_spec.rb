require 'rails_helper'

feature 'User can give an activity', %q{
  In order to share my knowledge
  As an authenticated user
  I want to be able to create activity
} do

  given(:user) { create(:user) }
  given!(:activity) { create(:activity) }

  scenario 'Authenticated user create activity', js: true do
    sign_in(user)
    visit activity_path(activity)

    fill_in 'Name', with: 'My activity'
    click_on 'Create activity'

    expect(current_path).to eq activity_path(activity)
    within '.activitys' do # чтобы убедиться, что activity в списке, а не в форме
      expect(page).to have_content 'My activity'
    end
  end

  scenario 'Authenticated user creates activity with errors', js: true do
    sign_in(user)
    visit activity_path(activity)

    click_on 'Create activity'

    expect(page).to have_content "Name can't be blank"
  end
end