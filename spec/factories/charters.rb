FactoryBot.define do
  factory :charter do
    departure               {'東京都中央区'}
    arrive                  {'大阪府大阪市'}
    size                    {30}
    buy_price               {60000}
    prefecture_id           {28}  
    city                    {'大阪市'}
    charter_address         {'北区曽根崎2-3-5'}
    build_name              {'梅新第一生命ビル'}
    tell_number             {'09012345678'}
    association :user
  end
end