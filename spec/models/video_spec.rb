require 'spec_helper'

describe Video do

  describe "Database Tests" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:downloads).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:video_link).of_type(:string) }
  end

  describe "Validation Tests" do
    let(:blanks){[nil, '']}
    it { should have_valid(:title).when("Beach sunset") }
    it { should_not have_valid(:title).when(*blanks) }

    it { should have_valid(:description).when("Footage shot at Bahamas") }
    it { should_not have_valid(:description).when(*blanks) }

    it { should have_valid(:video_link).when("http://vimeo.com/34009539") }
    it { should_not have_valid(:video_link).when(*blanks) }

    it { should validate_numericality_of(:downloads).only_integer }
    let(:invalid_amount){['99,999', -3]}
    it { should have_valid(:downloads).when(0, 99999) }
    it { should_not have_valid(:downloads).when(*invalid_amount) }

    it { should validate_numericality_of(:user_id).only_integer }
  end

  describe "Association Tests" do
    it { should have_many(:comments).dependent(:destroy) }
    it { should belong_to(:user) }
  end

  describe "Video Link Tests" do
    good_urls = %w{https://vimeo.com/44067566
      http://vimeo.com/44067566
      https://www.vimeo.com/44067566
      http://www.vimeo.com/44067566
      https://vimeo.com/groups/name/videos/44067566
      http://vimeo.com/groups/name/videos/44067566
      https://vimeo.com/album/2222222/video/44067566
      http://vimeo.com/album/2222222/video/44067566
      https://vimeo.com/44067566?param=test
      http://vimeo.com/44067566?param=test}

    it 'returns video id from good urls' do
      video = Video.new
      good_urls.each do |url|
        video.video_link = url
        expect(video.vimeo_id).to eql('44067566')
      end 
    end

  end
end
