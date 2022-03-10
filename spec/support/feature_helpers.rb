# frozen_string_literal: true

module FeatureHelpers
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  def sign_up(user)
    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation
    click_button 'Sign up'
    open_email(user.email)
    current_email.click_link 'Confirm my account'
    visit user_confirmation_path(confirmation_token: email_token)
    expect(page).to have_content 'Your email address has been successfully confirmed.'
  end
end
