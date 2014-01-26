require 'spec_helper'

describe Comment do

  describe "Database Tests" do
    it { should have_db_column(:content).of_type(:text) }
    it { should have_db_column(:video_id).of_type(:integer) }
  end

  describe "Validation Tests" do
    it { should have_valid(:content).when("Awesome video bro!") }
    it { should_not have_valid(:content).when(nil, "") }

    it { should validate_numericality_of(:video_id).only_integer }
  end

  describe "Association Tests" do
    it { should belong_to :video }
    it { should belong_to :user }
  end

end
