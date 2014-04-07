require 'spec_helper'

describe Question do

  it "has a valid factory" do
    FactoryGirl.build(:question).should be_valid
  end

  it { should belong_to(:owner).class_name(User) }

  it { should ensure_length_of(:text).is_at_least(1).is_at_most(100) }

  it { should_not allow_value('').for(:text) }

  it { should validate_presence_of(:owner) }
end