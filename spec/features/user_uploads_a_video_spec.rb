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
# * I must be logged in to upload a video.

  let(:user) { FactoryGirl.create(:user)}

  scenario 'Not authenticated user cannot upload a video' do
    visit new_video_path
    expect(page).to have_content("You need to sign in")
  end

  context 'with valid title and description' do
    # make this one save the user id on the video
    # need to make user has many vids association
    it 'uploads a video' do
      # sign in first as user
      # and save user id on video here
      sign_in_as(user)
      count = Video.all.count
      visit new_video_path
      fill_in "Title", with: "Beach sunset"
      fill_in "Description", with: "A beach sunset filmed in the Bahamas"
      fill_in "Vimeo link", with: "http://vimeo.com/34009539"
      click_button "Upload"

      expect(page).to have_content("Beach sunset")
      expect(Video.all.count).to eq(count + 1)
    end
  end

  context 'with invalid title and description' do
    it 'does not upload a video' do
      sign_in_as(user)
      count = Video.all.count
      visit new_video_path
      click_button "Upload"

      expect(page).to have_content("Error!")
      expect(Video.all.count).to eq(count)
    end
  end

end