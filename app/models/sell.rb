class Sell < ApplicationRecord
  # バリデーション
  
  # アソシエーション
  belongs_to :user
  belongs_to :charter
end
