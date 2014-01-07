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


  context 'with valid title and description' do
    it 'uploads a video' do
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
      count = Video.all.count
      visit new_video_path
      click_on "Upload"

      expect(page).to have_content("Error!")
      expect(Video.all.count).to eq(count)
    end
  end

end