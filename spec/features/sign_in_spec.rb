# frozen_string_literal: true

require 'rails_helper'

describe 'USER CAN (SIGHN_IN / SIGN_OUT / REGISTRATION or NOT)', '
  Registration user can sign in
  User can sign out system
  Unregistered user not sign in
' do
  let(:user) { create(:user) }

  it 'Registration user can sign in' do
    sign_in(user)
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'User can sign out system' do
    sign_in(user)
    visit xroots_path
    click_on 'Sign out'
    expect(page).to have_content 'Signed out successfully.'
  end

  it 'Unregistered user not sign in' do
    visit new_user_session_path

    fill_in 'Email', with: 'unregistered@example.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
  end
end
