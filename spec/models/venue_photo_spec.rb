require "spec_helper"

describe VenuePhoto do
  it { should belong_to(:venue) }
end
