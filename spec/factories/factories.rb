FactoryGirl.define do

  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    cellphone "555-555-5555"
    password "password"
    timezone "Pacific Time (US & Canada)"
  end

  factory :update do
    user FactoryGirl.build(:user)
    content "This is a plain update"
    twilio_body "{}"
  end

  factory :update_with_hashtag do
    content "Test my #one hashtag"
    twilio_body "{}"
  end

  factory :update_with_many_hashtags do
    content "Test my #multiple #hasttags"
    twilio_body "{}"
  end

end