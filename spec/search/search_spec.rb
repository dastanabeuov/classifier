require_relative 'sphinx_helper'

feature 'Search', %q{
  In order to find information
  As user
  I want to search info about xroot, xcategory, xclass, property, activity and users
} do

  given!(:user) { create(:user, email: 'search@example.com') }
  given!(:xroot) { create(:xroot, title: 'search xroot', user: user) }
  given!(:xcategory) { create(:xcategory, xroot: xroot, user: user, title: 'search xcategory') }
  given!(:xclass) { create(:xclass, xcategory: xcategory, user: user, title: 'search xclass') }
  given!(:property_for_xclass) { create(:property, propertyable: xclass, title: 'search xclass property') }
  given!(:activity) { create(:activity, user: user, title: 'search activity') }

  context 'Users' do
    scenario 'can view search form' do
      visit root_path

      expect(page).to have_selector("input[name='search[query]']")
      expect(page).to have_selector("select[name='search[resource]']")
    end

    scenario 'can view results page', js: true do
      ThinkingSphinx::Test.run do
        ThinkingSphinx::Test.index
        visit root_path
        fill_in 'search_query', with: 'no in the database'
        click_on 'Search'

        expect(page).to have_content 'No results'
      end
    end

    scenario 'can search from xroots', js: true do
      ThinkingSphinx::Test.run do
        ThinkingSphinx::Test.index
          visit xroots_path
          fill_in 'search_query', with: 'search xroot'
          select 'Xroot', from: 'search_resource'
          click_on 'Search'

          within '.results' do
            expect(page).to have_link xroot.title
          end
      end
    end

    scenario 'can search from xcategory', js: true do
      ThinkingSphinx::Test.run do
        ThinkingSphinx::Test.index
          visit xroots_path
          fill_in 'search_query', with: 'search xcategory'
          select 'Xcategory', from: 'search_resource'
          click_on 'Search'

        within '.results' do
          expect(page).to_not have_link xcategory.title
        end
      end
    end

    scenario 'can search answer xclass', js: true do
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

    scenario 'can search xclass property', js: true do
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

    scenario 'can search users', js: true do
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