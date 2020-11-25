require 'rails_helper'
describe ChartersController, type: :request do
  before do
    @charter = FactoryBot.create(:charter)
    @user =FactoryBot.create(:user)
  end

  describe "GET #index" do
    it "indexアクションにリクエストすると正常にレスポンスが帰ってくる" do
      get root_path
      expect(response).to have_http_status(200)
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのチャーター便が入っている(出発)" do
      get root_path
      expect(response.body).to include @charter.departure
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのチャーター便が入っている(到着)" do
      get root_path
      expect(response.body).to include @charter.arrive
    end
    it "indexアクションにリクエストするとレスポンスに検索フォームがある" do
      get root_path
      expect(response.body).to include '投稿を検索する'
    end
  end

  describe "GET #show" do
    it "indexアクションにリクエストすると正常にレスポンスが帰ってくる" do
      get charter_path(@charter)
      expect(response).to have_http_status(200)
    end
    it "showアクションにリクエストするとレスポンスに出発場所が表示されている" do
      get charter_path(@charter)
      expect(response.body).to include @charter.departure
    end
    it "showアクションにリクエストするとレスポンスに到着場所が表示されている" do
      get charter_path(@charter)
      expect(response.body).to include @charter.arrive
    end
    it "showアクションにリクエストするとレスポンスに才数が表示されている" do
      get charter_path(@charter)
      expect(response.body).to include "#{@charter.size}才"
    end
    it "showアクションにリクエストするとレスポンスに希望小売価格が表示されている" do
      get charter_path(@charter)
      expect(response.body).to include "#{@charter.buy_price}円"
    end
    it "showアクションにリクエストするとレスポンスに都道府県が表示されている" do
      get charter_path(@charter)
      expect(response.body).to include @charter.prefecture.name
    end
    it "showアクションにリクエストするとレスポンスに市区町村が表示されている" do
      get charter_path(@charter)
      expect(response.body).to include @charter.city
    end
    it "showアクションにリクエストするとレスポンスに番地が表示されている" do
      get charter_path(@charter)
      expect(response.body).to include @charter.build_name
    end
  end
end

