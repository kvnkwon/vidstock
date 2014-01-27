require 'spec_helper'

feature "User creates a comment", %q{
  As an authenticated user
  I want to comment on a video
  So that I can share my thoughts on that video
} do

# Acceptance Criteria:

# * For a particular video I must specify content text for the comment
# * If I do not specify content text, an error is displayed
# * If I specify content text, the comment is saved and viewable on the commented video's page
 let(:user) { FactoryGirl.create(:user) }
 
 scenario 'add valid comment to video' do
    video = FactoryGirl.create(:video)
    sign_in_as(user)
    visit video_path(video)
    fill_in 'comment_content', with: 'Awesome footage!'
    click_on 'Submit'

    expect(page).to have_content 'Awesome footage!'
  end

  scenario 'invalid comment with no body text' do
    video = FactoryGirl.create(:video)
    sign_in_as(user)
    visit video_path(video)
    click_on 'Submit'

    expect(page).to have_content 'Error'
  end

end