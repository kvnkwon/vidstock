require 'spec_helper'

feature "User searches for a video", %q{
  As an authenticated user,
  I want to search for a video using keywords or tags,
  So that I can find the video I want with ease.
} do

# Acceptance Criteria:
# * User must specify a title in the search bar.
# * User must specify a tag in the search bar.
# * User can group tags together with commas.
# * If no video is found, there are no results.
# * User receives all the videos that contain the title and tags they specified.
# * If videos for the title and tags they specified exist, they are redirected to a page that shows the videos that are returned.

  let(:user) { FactoryGirl.create(:user) }

  scenario 'Search for videos using a title' do
    sign_in_as(user)
    visit new_video_path
    fill_in "Title", with: "Kitty"
    fill_in "Description", with: "A Kitty filmed in the Bahamas"
    fill_in "Vimeo link", with: "http://vimeo.com/34009539"
    fill_in "Tags (seperated by commas)", with: "cat, cute, beach, tropical, bahamas"
    click_button "Upload"
    visit root_path
    fill_in "q[title_cont]", with: "Kitty"
    click_button "Search"

    expect(page).to have_content("Kitty")
    save_and_open_page
  end

  scenario 'Search for videos using tags' do
    sign_in_as(user)
    visit new_video_path
    fill_in "Title", with: "Kitty"
    fill_in "Description", with: "A Kitty filmed in the Bahamas"
    fill_in "Vimeo link", with: "http://vimeo.com/34009539"
    fill_in "Tags (seperated by commas)", with: "cat, cute, beach, tropical, bahamas"
    click_button "Upload"
    visit root_path
    fill_in "q[title_cont]", with: "cute, cats"
    click_button "Search"

    expect(page).to have_content("cute")
  end

  scenario 'Search for nonexisting videos using a title' do
    sign_in_as(user)
    visit new_video_path
    fill_in "Title", with: "Kitty"
    fill_in "Description", with: "A Kitty filmed in the Bahamas"
    fill_in "Vimeo link", with: "http://vimeo.com/34009539"
    fill_in "Tags (seperated by commas)", with: "cat, cute, beach, tropical, bahamas"
    click_button "Upload"
    visit root_path
    fill_in "q[title_cont]", with: "Wizard"
    click_button "Search"

    expect(page).to have_content("Browse Videos")
  end

end