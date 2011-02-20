require 'spec_helper'

describe CitySuggestion do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:from_name) }
  it { should validate_presence_of(:from_email) }
end
