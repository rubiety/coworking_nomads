require "spec_helper"
require "cancan/matchers"

describe Ability do
  context "when not logged in" do
    subject { described_class.new(nil) }

    it "should be able to :read active cities" do
      subject.should be_able_to(:read, Factory(:city, :active => true))
    end
    it "should not be able to :read inactive cities" do
      subject.should_not be_able_to(:read, Factory(:city, :active => false))
    end

    [User, Review, CheckIn].each do |model|
      it { should be_able_to(:read, model) }
      it { should_not be_able_to(:create, model) }
      it { should_not be_able_to(:update, model) }
      it { should_not be_able_to(:destroy, model) }
    end

    it { should be_able_to(:create, CitySuggestion) }
  end

  context "with a regular user" do
    before { @user = Factory(:user) }
    subject { described_class.new(@user) }

    it "should be able to :read active cities" do
      subject.should be_able_to(:read, Factory(:city, :active => true))
    end
    it "should not be able to :read inactive cities" do
      subject.should_not be_able_to(:read, Factory(:city, :active => false))
    end

    [User, Review, CheckIn].each do |model|
      it { should be_able_to(:read, model) }
    end

    it "should be able to :manage self" do
      subject.should be_able_to(:manage, @user)
    end
    it "should not be able to :manage another user" do
      subject.should_not be_able_to(:manage, Factory(:user))
    end

    it { should be_able_to(:create, Review) }
    
    it "should be able to :update my own review" do
      subject.should be_able_to(:update, Factory(:review, :user => @user))
    end
    it "should not be able to :update someone else's review" do
      subject.should_not be_able_to(:update, Factory(:review))
    end

    [CitySuggestion, VenueSuggestion].each do |model|
      it { should be_able_to(:create, model) }
      it { should_not be_able_to(:read, model) }
      it { should_not be_able_to(:update, model) }
      it { should_not be_able_to(:destroy, model) }
    end

    it { should be_able_to(:create, CheckIn) }

    it "should be able to :destroy my own check in" do
      subject.should be_able_to(:destroy, Factory(:check_in, :user => @user))
    end
    it "should not be able to :destroy someone else's check in" do
      subject.should_not be_able_to(:destroy, Factory(:check_in))
    end
    
  end

  context "with an admin" do
    before { @user = Factory(:admin) }
    subject { described_class.new(@user) }
    it { should be_able_to(:manage, :all) }
  end
end
