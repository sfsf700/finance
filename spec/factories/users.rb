FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
  end
end
