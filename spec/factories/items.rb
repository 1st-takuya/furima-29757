FactoryBot.define do
  factory :item do
    name        { Faker::Name.name }
    text        { Faker::Lorem.sentence }
    category_id { 1 }
    quality_id  { 1 }
    postage_id  { 1 }
    shipping_id { 1 }
    day_id      { 1 }
    price       { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |png|
      png.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
