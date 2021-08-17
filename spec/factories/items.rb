FactoryBot.define do
  factory :item do
    text { 'あ' }
    name             { 'あ' }
    category_id      { 2 }
    condition_id     { 2 }
    shipping_cost_id { 2 }
    prefecture_id    { 2 }
    delivery_time_id { 2 }
    price            { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
