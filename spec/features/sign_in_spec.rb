require 'rails_helper'

feature 'User can signin', %q{
  In order to ask question
  As an unauthenticate User
  I'd like to be able to sign in
  User sign in system
  User log out system
  User register in system
} do
  given(:user) { create(:user) }
  
  background { visit new_user_session_path }
  
  #save_and_open_page

  scenario 'Registration user tries sign in' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Login'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Unregistered user tries sign in' do
    fill_in 'Email', with: 'wrong@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'User can logout system' do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    visit xroots_path
    click_on 'Logout'
    expect(page).to have_content 'Signed out successfully.'
  end

  scenario 'User can register on system' do
    visit new_user_registration_path
    fill_in 'Email', with: 'newuser@test.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    visit user_confirmation_path(confirmation_token: email_token)
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end