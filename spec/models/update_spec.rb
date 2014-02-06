require 'spec_helper'

describe Update do
  it { should belong_to :user }
  it { should have_and_belong_to_many :tags }
end
