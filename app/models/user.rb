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
  has_many :sells
  has_many :purchases

  def self.guest
    find_or_create_by!(
      username: 'ゲスト',
      email: 'guest@example.com',
      phone_number: '09011223456',
      prefecture_address: '東京都',
      city_address: '中央区',
      house_number: '日本橋',
      ) do |user|
      user.password = SecureRandom.alphanumeric(8)
    end
  end
end