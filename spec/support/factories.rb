FactoryGirl.define do
  factory :user do
    email  { Faker::Internet.email }
    password 'secret123'
    password_confirmation 'secret123'
  end
  
  factory :record do
    legacy_asset_id { Faker::Lorem.words(3) }
    notes { Faker::Lorem.paragraph }
    condition_notes { Faker::Lorem.paragraph }
  end
  
  factory :image do
    file { fixture_file_upload(Rails.root.join('spec', 'support', 'images', 'image.png'), 'image/png') }
  end
  
  factory :import do
    
  end
end
