require 'spec_helper'

describe VenueSuggestion do
  it { should belong_to(:user) }
  it { should belong_to(:city) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }

  it "should expose #to_s as name" do
    described_class.new(:name => "Test").to_s.should == "Test"
  end
end
