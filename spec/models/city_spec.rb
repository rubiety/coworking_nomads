require "spec_helper"

describe City do
  it { should have_many(:users) }
  it { should have_many(:venues) }
  it { should have_many(:venue_suggestions) }
  
  it { should validate_presence_of(:name) }
  
  describe "validating uniqueness" do
    before { Factory(:city) }
    it { should validate_uniqueness_of(:name) }
  end
  
  describe "scopes" do
    before do
      @active_city = Factory(:city, :active => true)
      @inactive_city = Factory(:city, :active => false)
    end
    
    describe "active" do
      it "should return only active cities" do
        described_class.active.should == [@active_city]
      end
    end
    
    describe "inactive" do
      it "should return only inactive cities" do
        described_class.inactive.should == [@inactive_city]
      end
    end
  end

  it "should activate an inactive city" do
    Factory(:city, :active => false).tap do |city|
      city.activate
      city.should be_active
    end
  end

  it "should deactivate an active city" do
    Factory(:city, :active => true).tap do |city|
      city.deactivate
      city.should_not be_active
    end
  end

  it "should expose #to_s as name" do
    described_class.new(:name => "Test").to_s.should == "Test"
  end
end
