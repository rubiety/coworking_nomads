require "spec_helper"

describe Review do
  it { should belong_to(:venue) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:venue_id) }
  it { should validate_presence_of(:user_id) }
  it { should ensure_inclusion_of(:rating).in_range(1..10) }
  it { should ensure_inclusion_of(:wifi_rating).in_range(1..10) }
  it { should ensure_inclusion_of(:ambiance_rating).in_range(1..10) }
  it { should ensure_inclusion_of(:table_availability_rating).in_range(1..10) }

  describe "scopes" do
    before do
      @active_review = Factory(:review, :active => true)
      @inactive_review = Factory(:review, :active => false)
    end
    
    describe "active" do
      it "should return only active reviews" do
        described_class.active.should == [@active_review]
      end
    end
    
    describe "inactive" do
      it "should return only inactive reviews" do
        described_class.inactive.should == [@inactive_review]
      end
    end
  end

  it "should activate an inactive review" do
    Factory(:review, :active => false).tap do |review|
      review.activate
      review.should be_active
    end
  end

  it "should deactivate an active city" do
    Factory(:review, :active => true).tap do |review|
      review.deactivate
      review.should_not be_active
    end
  end

end
