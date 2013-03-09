FactoryGirl.define do
  factory :user do
    email  { Faker::Internet.email }
    password 'secret123'
    password_confirmation 'secret123'
  end
  
  factory :record do
    asset_id { Faker::Lorem.words(3) }
    notes { Faker::Lorem.paragraph }
    misc { "" }
  end
end
