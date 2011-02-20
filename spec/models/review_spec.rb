require "spec_helper"

describe Review do
  it { should belong_to(:venue) }
  it { should belong_to(:user) }

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
