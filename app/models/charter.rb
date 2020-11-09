class Charter < ApplicationRecord
  # バリデーション
  with_options presence: true do
    validates :departure
    validates :arrive
    validates :size
    validates :delivery_date
    validates :buy_price
    validates :prefecture_id
    validates :city
    validates :charter_address
    validates :build_name
    validates :tell_number
  end
  
  # アソシエーション
  has_many :charter_users
  has_many :users, through: :charter_users
  has_many :sellOrders
  has_one  :order
end
