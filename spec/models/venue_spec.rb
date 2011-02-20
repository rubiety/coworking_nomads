require 'spec_helper'

describe Venue do
  it { should belong_to(:city) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:city_id) }

  describe "validating uniqueness" do
    before { Factory(:venue) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "scopes" do
    before do
      @active_venue = Factory(:venue, :active => true)
      @inactive_venue = Factory(:venue, :active => false)
    end
    
    describe "active" do
      it "should return only active venues" do
        described_class.active.should == [@active_venue]
      end
    end
    
    describe "inactive" do
      it "should return only inactive venues" do
        described_class.inactive.should == [@inactive_venue]
      end
    end
  end

  it "should activate an inactive venue" do
    Factory(:venue, :active => false).tap do |venue|
      venue.activate
      venue.should be_active
    end
  end

  it "should deactivate an active venue" do
    Factory(:venue, :active => true).tap do |venue|
      venue.deactivate
      venue.should_not be_active
    end
  end

  it "should expose #to_s as name" do
    described_class.new(:name => "Test").to_s.should == "Test"
  end
end
