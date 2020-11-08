FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    explanation { 'eeeeeeeeeeeeeeeeeeeeee' }
    category_id { 2 }
    product_condition_id { 2 }
    delivery_fee_id { 2 }
    shipment_source_id { 2 }
    day_id { 2 }

    selling_price { 500 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
