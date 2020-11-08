FactoryBot.define do
  factory :user do
    username                  { Faker::Name.name}
    email                     { Faker::Internet.free_email}
    password                  { "Tanakaaaa" }
    password_confirmation     { password }
    phone_number              { Faker::Number.number(digits: 10) }
    prefecture_address         { Faker::Address.state }
    city_address              { Faker::Address.city }
    house_number              { Faker::Address.street_name + Faker::Address.street_address }
  end
end
