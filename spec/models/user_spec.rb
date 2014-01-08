require 'spec_helper'

describe User do

  describe "Database Tests" do
    it { should have_db_column(:username).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    it { should have_db_column(:role).of_type(:string) }
  end

  describe "Validation Tests" do
    let(:blanks){[nil, '']}
    it { should have_valid(:username).when("KwonMasta") }
    it { should_not have_valid(:username).when(*blanks) }

    it { should have_valid(:email).when("kwonnyk@gmail.com") }
    it { should_not have_valid(:email).when("gmail.com") }

  end

  describe "Association Tests" do
    it { should have_many(:videos).dependent(:destroy) }
  end

end
