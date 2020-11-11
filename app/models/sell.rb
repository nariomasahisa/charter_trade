class Sell < ApplicationRecord
  default_scope -> { order(sell: :asc)}
  # バリデーション
  
  # アソシエーション
  belongs_to :user
  belongs_to :charter
end
