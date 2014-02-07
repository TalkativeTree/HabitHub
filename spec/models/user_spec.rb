require 'spec_helper'

describe User do
  it { should have_many :updates }
  it { should have_one :plan }

  it { should validate_uniqueness_of :email }
  it { should validate_presence_of   :email }

  it { should validate_presence_of   :cellphone }

  it "should validate_uniqueness_of cellphone" do
    FactoryGirl.create(:user, email: "test_unique@gmail.com")
    failure = FactoryGirl.build(:user, email: "test_unique@gmail.com")
    failure.save
    expect( failure.errors.full_messages ).to include("Email has already been taken")
  end

  context "email validation" do
    it { should     allow_value("test@email.com").for(:email) }
    it { should_not allow_value("test").for(:email) }
  end
end
