require 'sphinx_helper'

feature 'Search', %q{
  can view search form
  can view results page
  search info about xclass, property, activity and users
} do

  given!(:user) { create(:user, email: 'search@example.com') }
  given!(:xclass) { create(:xclass, user: user, title: 'search xclass') }
  given!(:activity) { create(:activity, user: user, title: 'search activity') }
  given!(:property_for_xclass) { create(:property, propertyable: xclass, activity_id: activity.id, title: 'search xclass property') }

  context 'Users' do
    scenario 'can view search form' do
      visit root_path

      expect(page).to have_selector("input[name='search[query]']")
      expect(page).to have_selector("select[name='search[resource]']")
    end

    scenario 'can view results page', sphinx: true, js: true do
      ThinkingSphinx::Test.run do
        ThinkingSphinx::Test.index
        visit root_path
        fill_in 'search_query', with: 'no in the database'
        click_on 'Search'

        expect(page).to have_content 'No results'
      end
    end

    scenario 'can search answer xclass', sphinx: true, js: true do
      ThinkingSphinx::Test.run do
        ThinkingSphinx::Test.index
        visit questions_path
        fill_in 'search_query', with: 'search xclass'
        select 'Xclass', from: 'search_resource'
        click_on 'Search'

        within '.results' do
          expect(page).to have_link xclass.title
        end
      end
    end

    scenario 'can search xclass property', sphinx: true, js: true do
      ThinkingSphinx::Test.run do
        ThinkingSphinx::Test.index
        visit questions_path
        fill_in 'search_query', with: 'search xclass property'
        select 'Property', from: 'search_resource'
        click_on 'Search'

        within '.results' do
          expect(page).to have_link property_for_xclass.title
        end
      end
    end

    scenario 'can search users', sphinx: true, js: true do
      ThinkingSphinx::Test.run do
        ThinkingSphinx::Test.index
        visit questions_path
        fill_in 'search_query', with: 'search@example.com'
        select 'User', from: 'search_resource'
        click_on 'Search'

        within '.results' do
          expect(page).to have_content user.email
        end
      end
    end
  end
end