require 'rails_helper'

feature 'USER CAN (SIGHN_IN / SIGN_OUT / REGISTRATION or NOT)', '
  Registration user can sign in
  User can sign out system
  Unregistered user not sign in
  User can register on system
' do

  given(:user) { create(:user) }

  scenario 'Registration user can sign in' do
    sign_in(user)
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'User can sign out system' do
    sign_in(user)
    visit xroots_path
    click_on 'Sign out'
    expect(page).to have_content 'Signed out successfully.'
  end

  scenario 'Unregistered user not sign in' do
    visit new_user_session_path

    fill_in 'Email', with: 'unregistered@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
  end

  # scenario 'User can register on system' do
  #   visit new_user_registration_path

  #   fill_in 'Email', with: 'unregistered@example.com'
  #   fill_in 'Password', with: '123456'
  #   fill_in 'Password confirmation', with: '123456'
  #   find(:css, '.btn-outline-primary').click
  #   visit user_confirmation_path(confirmation_token: email_token)
  #   find(:css, '.btn-outline-primary').click    

  #   ### I can't find, how type confirmation token from user!!!

  #   expect(page).to have_content 'Welcome! You have signed up successfully.'
  # end
end
