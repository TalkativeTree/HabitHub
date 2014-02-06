require 'spec_helper'

describe Update do
  it { should belong_to :user }
  it { should have_and_belong_to_many :tags }

  it { should validate_presence_of :content}
  it { should validate_presence_of :twilio_body}
  it { should validate_presence_of :duration}

  it "should have a default value of '1' for duration" do
    update = FactoryGirl.create(:update)
    update.duration.should == "1"
  end
end
