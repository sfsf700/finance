FactoryBot.define do
  factory :genre do
    g_name {Faker::Lorem.sentence}
    association :user 
  end
end
