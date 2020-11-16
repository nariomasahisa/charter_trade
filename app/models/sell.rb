class Sell < ApplicationRecord
  # バリデーション
  validates :sell, presence: true
  validates :sell,
    numericality: { greater_than_or_equal_to: 5000, less_than_or_equal_to: 10000000 },
    format: { with: /\A[0-9]+\z/ }
  # アソシエーション
  belongs_to :user
  belongs_to :charter
end
