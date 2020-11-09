class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # バリデーション
  with_options presence: true do
    validates :username
    validates :email
    validates :password
    validates :phone_number
    validates :prefecture_address
    validates :city_address
    validates :house_number
  end

  validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :password, 
    format: { with: /\A[a-zA-Z0-9]+\z/ },
    length: { minimum: 8 }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  # アソシエーション
  has_many :charters
  has_many :sellOrders
  has_many :orders
end

