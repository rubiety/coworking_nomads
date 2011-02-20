require "spec_helper"
require "cancan/matchers"

describe Ability do
  context "with a regular user" do
    before { @user = Factory(:user) }
    subject { described_class.new(@user) }
    it { should be_able_to(:read, :all) }
    it { should_not be_able_to(:read, CitySuggestion) }
    it { should be_able_to(:create, CitySuggestion) }
    it { should_not be_able_to(:read, VenueSuggestion) }
    it { should be_able_to(:create, VenueSuggestion) }
    
    it "should be able to :manage self" do
      subject.should be_able_to(:manage, @user)
    end
    
    it "should not be able to :manage another user" do
      subject.should_not be_able_to(:manage, Factory(:user))
    end
  end

  context "with an admin" do
    before { @user = Factory(:admin) }
    subject { described_class.new(@user) }
    it { should be_able_to(:manage, :all) }
  end
end
