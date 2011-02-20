require "spec_helper"

describe User do
  it { should belong_to(:city) }
  it { should have_many(:reviews) }
  it { should have_many(:venue_suggestions) }
  it { should have_many(:check_ins) }

  it "should expose #name as first_name and last_name" do
    described_class.new(:first_name => "Ben", :last_name => "Hughes").tap do |u|
      u.name.should == "Ben Hughes"
    end
  end

  it "should expose #to_s as name" do
    described_class.new(:first_name => "Ben", :last_name => "Hughes").tap do |u|
      u.to_s.should == "Ben Hughes"
    end
  end
  
end
