require 'spec_helper'

describe Video do

  describe "Database Tests" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:downloads).of_type(:integer) }
  end

  describe "Validation Tests" do
    let(:blanks){[nil, '']}
    it { should have_valid(:title).when("Beach sunset") }
    it { should_not have_valid(:title).when(*blanks) }

    it { should have_valid(:description).when("Footage shot at Bahamas") }
    it { should_not have_valid(:description).when(*blanks) }

    it { should validate_numericality_of(:downloads).only_integer }
    let(:invalid_amount){['99,999', -3]}
    it { should have_valid(:downloads).when(0, 99999) }
    it { should_not have_valid(:downloads).when(*invalid_amount) }
  end

  describe "Association Tests" do
    it { should have_many(:comments).dependent(:destroy) }
  end

end
