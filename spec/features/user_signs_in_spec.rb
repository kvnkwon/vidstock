require 'spec_helper'

feature "User signs in with an account", %q{
  As a registered user,
  I want to sign in,
  so that I can access authenticated user features.
} do

# Acceptance Criteria:
# * User must specify username and password.
# * User is prompted with errors for invalid inputs.
# * User is signed in upon correct input.

  scenario 'with existing account and valid input' do
    visit new_user_session_path
    fill_in "Email", with: "kwon@email.com"
    fill_in "Password", with: "12345678"
    click_on "Sign in"

    expect(page).to have_content 'Sign out'
  end

  scenario 'with existing account and invalid input' do
    visit new_user_session_path
    fill_in "Email", with: "kwon@email.com"
    fill_in "Password", with: "12345678"
    click_on "Sign in"

    expect(page).to have_content 'Sign out'
  end

  scenario 'with not an existing account' do
    visit new_user_session_path
    fill_in "Email", with: "kwon@email.com"
    fill_in "Password", with: "12345678"
    click_on "Sign in"

    expect(page).to have_content 'Sign out'
  end

end