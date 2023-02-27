FactoryBot.define do
  factory :record do

    price { Faker::Number.between(from: 0, to: 2000000000) }
    fdate {Faker::Date.between(from: '2020-09-28', to: '2022-09-28')}
    memo {Faker::Lorem.sentence}
    status { Faker::Number.between(from: 1, to: 2) }

    association :genre
    association :user
    
  end
end
