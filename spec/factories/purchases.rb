FactoryBot.define do
  factory :PurchasesStreetAddress do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { 123 - 1234 }
    prefectures_id { 2 }
    municipality { '福岡市' }
    address { '中洲' }
    phone_number { '09033336666' }
  end
end
