require 'faker'

FactoryGirl.define do

  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    cellphone "555-555-5555"
    password "password"
    time_zone "Pacific Time (US & Canada)"
  end

  factory :update do
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

  factory :plan do

    stripe_customer_token   { "token" }
    card_last4              { "2222" }
    card_type               { "Visa" }

    after(:build) do |plan|
      plan.user << FactoryGirl.build(:user, plan: plan)
    end

    factory :invalid_contact do
      stripe_customer_token nil
      card_last4            nil
      card_type             nil
    end
  end

end