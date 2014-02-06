require 'spec_helper'

describe Tag do
  it { should have_and_belong_to_many :updates }

  it { should validate_presence_of :title}
end
