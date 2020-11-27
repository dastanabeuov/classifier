require 'rails_helper'

feature 'USER CAN SIGHN_IN', %q{
  User can register on system
  Registration user tries sign in
  User can logout system
  Unregistered user tries sign in
} do

  given(:user) { create(:user) }
  
  #save_and_open_page
  scenario 'User can register on system' do
    visit new_user_registration_path
    fill_in 'Email', with: 'new@example.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    visit user_confirmation_path(confirmation_token: email_token)
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'Registration user tries sign in' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'User can logout system' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit xroots_path
    click_on 'Logout'
    expect(page).to have_content 'Signed out successfully.'
  end

  scenario 'Unregistered user tries sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'warning@example.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end