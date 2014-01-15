require 'spec_helper'

feature "User adds and removes tags to a video", %q{
  As a video uploader,
  I want to add and remove tags to the video I uploaded,
  so that other users can look up my video with specific tags.
} do

# Acceptance Criteria:
# * When a user uploads a video, they are given the option to enter tags for the video.
# * If the tag does not exist, it creates the tag.
# * If the tag exists, the existing tag is used.
# * User enters edit video page and removes tag(s).


  let(:user) { FactoryGirl.create(:user) }

  scenario 'Add tags when I upload the video' do
    sign_in_as(user)
    visit new_video_path
    fill_in "Title", with: "Beach sunset"
    fill_in "Description", with: "A beach sunset filmed in the Bahamas"
    fill_in "Tags (seperated by commas)", with: "beach, tropical, bahamas"
    click_button "Upload"

    expect(page).to have_content("Video was successfully uploaded!")
  end

  # scenario 'Add tags to a video I already uploaded' do
  #   sign_in_as(user)
  #   visit (edit video path)
  #   fill_in "Tags (seperated by commas)", with: "beach, tropical, bahamas"
  #   click_button "Save"

  #   expect(page).to have_content("Video was saved.")
  # end

  # scenario 'Remove tags to a video I already uploaded' do
  #   sign_in_as(user)
  #   visit (edit video path)
  #   fill_in "Tags (seperated by commas)", with: "beach, tropical, bahamas"
  #   click_button "Save"

  #   expect(page).to have_content("Video was saved.")
  # end

end