FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id    { 2 }
    city             { '横浜市' }
    house_number     { '青山１−１' }
    building_name { 'ビル103' }
    telephone_number { '0123456789' }
    token            { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
