FactoryBot.define do
  factory :sell do
    sell              {600000}
    association :charter
    association :user
  end
end
