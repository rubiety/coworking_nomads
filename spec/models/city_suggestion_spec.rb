require "spec_helper"

describe CitySuggestion do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:from_name) }
  it { should validate_presence_of(:from_email) }

  it "should expose #to_s as name" do
    described_class.new(:name => "Test").to_s.should == "Test"
  end
end
