class Sell < ApplicationRecord
  # バリデーション
  validates :sell, presence: true
  # アソシエーション
  belongs_to :user
  belongs_to :charter
end
