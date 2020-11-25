require 'rails_helper'
describe Sell, type: :model do
  before do
    @sell = FactoryBot.build(:sell)
  end

  describe '入札' do
    it '売値を投稿できる' do
      expect(@sell).to be_valid
    end
    it '売値が空だと投稿できない' do
      @sell.sell = nil
      @sell.valid?
    end
  end
end
