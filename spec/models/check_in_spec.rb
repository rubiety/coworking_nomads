require "spec_helper"

describe CheckIn do
  it { should belong_to(:venue) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:venue_id) }
  it { should validate_presence_of(:user_id) }
end
