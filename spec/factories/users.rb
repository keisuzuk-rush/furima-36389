FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name_kanji      { 'あ' }
    last_name_kanji       { 'あ' }
    first_name_kana       { 'ア' }
    last_name_kana        { 'ア' }
    birthday              { '1930-01-01' }
  end
end
