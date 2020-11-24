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
    it "indexアクションにリクエストするとレスポンスに投稿済みのチャーター便が帰ってくる" do
      get root_path
      expect(response.body).to include @charter.departure
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのチャーター便が帰ってくる" do
      get root_path
      expect(response.body).to include @charter.arrive
    end
    it "indexアクションにリクエストするとレスポンスに投稿済みのチャーター便が帰ってくる" do
      get root_path
      expect(response.body).to include '投稿を検索する'
    end
  end
end

