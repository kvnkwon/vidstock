require 'spec_helper'

feature "User uploads a video", %q{
  As an authenticated user
  I want to upload a video
  So that I can share my stock footage with the community
} do

# Acceptance Criteria:

# * When uploading a video I must specify the title and description
# * If I do not specify a title or description, an error is displayed
# * If I specify a title and description, the video is uploaded and viewable on the video's page
# * The download count for a new video is defaulted as 0.
# * I have administrative rights for the video that I uploaded.
  
  scenario 'uploader updates the title' do


  end

  context 'with valid title and description' do
    # make this one save the user id on the video
    # need to make user has many vids association
    it 'uploads a video' do
      # sign in first as user
      # and save user id on video here
      visit new_user_registration_path
      fill_in "Username", with: "Kwonny"
      fill_in "Email", with: "kwon@email.com"
      fill_in "Password", with: "12345678", match: :prefer_exact
      fill_in "Password confirmation", with: "12345678", match: :prefer_exact
      click_on "Register"
      count = Video.all.count
      visit new_video_path
      fill_in "Title", with: "Beach sunset"
      fill_in "Description", with: "A beach sunset filmed in the Bahamas"
      click_on "Upload"

      expect(page).to have_content("Beach sunset")
      expect(Video.all.count).to eq(count + 1)
    end
  end

  context 'with invalid title and description' do
    it 'does not upload a video' do
      visit new_user_registration_path
      fill_in "Username", with: "Kwonny"
      fill_in "Email", with: "kwon@email.com"
      fill_in "Password", with: "12345678", match: :prefer_exact
      fill_in "Password confirmation", with: "12345678", match: :prefer_exact
      click_on "Register"
      count = Video.all.count
      visit new_video_path
      click_on "Upload"

      expect(page).to have_content("Error!")
      expect(Video.all.count).to eq(count)
    end
  end

end