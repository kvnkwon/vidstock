require 'spec_helper'

feature "User registers an account", %q{
  As an unregistered user,
  I want to register for the website,
  so that I can upload, download, and comment on videos.
} do

# Acceptance Criteria:
# * User must specify a username, email, and password.
# * User's account is registered when all required fields are met.
# * User is prompted with an error for invalid input.

  scenario 'with valid input' do
    visit new_user_registration_path
    fill_in "Username", with: "Kwonny"
    fill_in "Email", with: "kwon@email.com"
    fill_in "Password", with: "12345678", match: :prefer_exact
    fill_in "Password confirmation", with: "12345678", match: :prefer_exact
    click_on "Sign up"

    expect(page).to have_content 'Sign out'
  end

  scenario 'with invalid input and get errors' do
    visit new_user_registration_path
    click_on 'Sign up'

    expect(page).to have_content "can't be blank"
  end

end