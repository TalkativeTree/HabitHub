require 'spec_helper'

describe User do
  it { should have_many :updates }

  it { should validate_uniqueness_of :email }
  it { should validate_presence_of   :email }

  it { should validate_presence_of   :cellphone }
  it { should validate_uniqueness_of :cellphone }

  context "email validation" do

    it { should_not allow_value("test").for(:email) }
    it { should_not allow_value("test.@3.").for(:email) }
    it { should_not allow_value("test.@gmail.sad.com").for(:email) }

    it "should allow only valid emails" do
      user = FactoryGirl.build(:user)
      expect(user).to be_valid
    end
  end
end
