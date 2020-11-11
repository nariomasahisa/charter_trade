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
  belongs_to :user
  has_many :sells
  has_one  :order
end
