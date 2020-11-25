require 'rails_helper'
describe Charter, type: :model do
  before do
    @charter = FactoryBot.build(:charter)
  end

  describe 'チャーター便発注' do
    it '必要なものが入力されていると発注できる' do
      expect(@charter).to be_valid
    end
    it 'ビル名が空でも発注できる' do
      @charter.build_name = nil
      expect(@charter).to be_valid
    end

    it '出発先が空だと発注できない' do
      @charter.departure = nil
      @charter.valid?
      expect(@charter.errors.full_messages).to include("Departure can't be blank")
    end
    it '到着場所が空だと発注できない' do
      @charter.arrive = nil
      @charter.valid?
      expect(@charter.errors.full_messages).to include("Arrive can't be blank")
    end
    it '才数が空だと発注できない' do
      @charter.size = nil
      @charter.valid?
      expect(@charter.errors.full_messages).to include("Size can't be blank")
    end
    it '希望小売価格が空だと発注できない' do
      @charter.buy_price = nil
      @charter.valid?
      expect(@charter.errors.full_messages).to include("Buy price can't be blank")
    end
    it '都道府県ハッシュが空だと発注できない' do
      @charter.prefecture_id = nil
      @charter.valid?
      expect(@charter.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと発注できない' do
      @charter.city = nil
      @charter.valid?
      expect(@charter.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと発注できない' do
      @charter.charter_address = nil
      @charter.valid?
      expect(@charter.errors.full_messages).to include("Charter address can't be blank")
    end
    it '電話番号が空だと発注できない' do
      @charter.tell_number = nil
      @charter.valid?
      expect(@charter.errors.full_messages).to include("Tell number can't be blank")
    end
  end
end