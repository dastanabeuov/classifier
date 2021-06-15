require 'rails_helper'

feature 'USER CAN SIGHN_IN', '
  User can register on system
  Registration user tries sign in
  User can logout system
  Unregistered user tries sign in
' do
  given(:user) { create(:user) }
  given(:invalid_user) { attributes_for(:user, email: 'warning@example.com', password: '12345678') }
  given(:unregistered_user) do
    attributes_for(:user, email: 'warning@example.com', password: '12345678', password_confirmation: '12345678')
  end

  scenario 'Registration user tries sign in' do
    sign_in(user)
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'User can logout system' do
    sign_in(user)
    visit xroots_path
    click_on 'Sign out'
    expect(page).to have_content 'Signed out successfully.'
  end

  scenario 'Unregistered user tries sign in' do
    sign_in(invalid_user)
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'User can register on system' do
    sign_up(unregistered_user)
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
