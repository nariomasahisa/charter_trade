require 'rails_helper'

RSpec.describe "発注", type: :system do
  before do
    @charter = FactoryBot.build(:charter)
    @user = FactoryBot.create(:user)
  end
  context 'チャーター便の発注ができる' do
    it '正しい情報を入力すれば発注できる' do
      # ログイン
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規発注ボタンを確認
      expect(page).to have_content('チャーターをご要望の方')
      # 発注ページに移動
      visit new_charter_path
      # 情報を入力
      fill_in '出発地', with: @charter.departure
      fill_in '到着地', with: @charter.arrive
      fill_in '才数', with: @charter.size
      fill_in '希望価格', with: @charter.buy_price
      # selected'都道府県', with: @charter.prefecture_id
      fill_in '市区町村', with: @charter.city
      fill_in '番地', with: @charter.charter_address
      fill_in '建物名', with: @charter.build_name
      fill_in '電話番号', with: @charter.tell_number
      # 発注ボタンを押すとCharterモデルのカウントが1増える
      expect{
        find('input[name="commit"]').click
      }.to change { Charter.count }.by(1)
      # トップページに戻る
      expect(current_path).to eq root_path
    end
  end
  context 'チャーター便の発注ができない' do
      it '不正確な情報だと発注できない' do
      # ログイン
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規発注ボタンを確認
      expect(page).to have_content('チャーターをご要望の方')
      # 発注ページに移動
      visit new_charter_path
      # 情報を入力(不正確な情報)
      fill_in '出発地', with: ""
      fill_in '到着地', with: ''
      fill_in '才数', with: ''
      fill_in '希望価格', with: ""
      # selected'都道府県', with: @charter.prefecture_id
      fill_in '市区町村', with: ""
      fill_in '番地', with: ""
      fill_in '建物名', with: ""
      fill_in '電話番号', with: ""
      # 発注ボタンを押すとCharterモデルのカウントが増えない
      expect{
        find('input[name="commit"]').click
      }.to change { Charter.count }.by(0)
      # 新規投稿ページのまま
      expect(current_path).to eq '/charters'
    end
  end
end

RSpec.describe "詳細", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @charter1 = FactoryBot.create(:charter)
    @charter2 = FactoryBot.create(:charter)
  end
  context '詳細ページへ行ける' do
    it '詳細ページへ行ける' do
      # ログイン
      visit new_user_session_path
      fill_in 'Email', with: @charter1.user.email
      fill_in 'Password', with: @charter1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # チャーター便を確認
      # expect(
      #   all("charter-name")
      # ).to have_link "東京都中央区→大阪府大阪市", href: charter_path(@charter)
      # 詳細ページへ移動
      visit charter_path(@charter1)
      expect(page).to have_no_selector 'form'
    end
    it '詳細ページへ行ける' do
      # ログイン
      visit new_user_session_path
      fill_in 'Email', with: @charter1.user.email
      fill_in 'Password', with: @charter1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # チャーター便を確認
      # expect(
      #   all("charter-name")
      # ).to have_link "東京都中央区→大阪府大阪市", href: charter_path(@charter)
      # 詳細ページへ移動
      visit charter_path(@charter2)
      expect(page).to have_selector 'form'
    end
  end
end

RSpec.describe "編集", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @charter1 = FactoryBot.create(:charter)
    @charter2 = FactoryBot.create(:charter)
  end
  context '編集ができる' do
    it '編集できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @charter1.user.email
      fill_in 'Password', with: @charter1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 詳細ページへいく
      visit charter_path(@charter1)
      # 編集ページを確認する
      expect(page).to have_content '編集'
      # 編集ページへ遷移する
      visit edit_charter_path(@charter1)
      # 正しい情報を入力する
      fill_in '出発地', with: @charter1.departure
      fill_in '到着地', with: @charter1.arrive
      fill_in '才数', with: @charter1.size
      fill_in '希望価格', with: @charter1.buy_price
      fill_in '市区町村', with: @charter1.city
      fill_in '番地', with: @charter1.charter_address
      fill_in '建物名', with: @charter1.build_name
      fill_in '電話番号', with: @charter1.tell_number
      # クリックする
      expect {
        find('input[name="commit"]').click
      }.to change {Charter.count }.by(0)
      # トップページへ戻る
      expect(current_path).to eq charter_path(@charter1)
    end
  end
  context '編集できない' do
    it 'ユーザーが違うと編集できない' do
      # ログインする
      visit new_user_session_path
      fill_in 'Email', with: @charter1.user.email
      fill_in 'Password', with: @charter1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 詳細ページへいく
      visit charter_path(@charter2)
      # 編集ボタンがない
      expect(page).to have_no_content '編集'
    end
    it 'ログインしていないと編集できない' do
      # 詳細ページへいく
      visit charter_path(@charter2)
      # 編集ボタンがない
      expect(page).to have_no_content '編集'      
    end
  end
end

RSpec.describe "削除", type: :system do
  before do
    @charter1 = FactoryBot.create(:charter)
    @charter2 = FactoryBot.create(:charter)
    @user = FactoryBot.create(:user)
  end

  context '削除できる' do
    it 'チャーター発注者は削除できる' do
      # ログイン
      visit new_user_session_path
      fill_in 'Email', with: @charter1.user.email
      fill_in 'Password', with: @charter1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 詳細ページへ
      visit charter_path(@charter1)
      # 削除ボタンを確認する
      expect(page).to have_content '削除'
      # 削除する
      expect {
        find_link('削除',href: charter_path(@charter1)).click
      }.to change {Charter.count }.by(-1)
      # トップページへ
      expect(current_path).to eq root_path
    end
    it '他ユーザーは削除できない' do
      # ログイン
      visit new_user_session_path
      fill_in 'Email', with: @charter1.user.email
      fill_in 'Password', with: @charter1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 詳細ページへ
      visit charter_path(@charter2)
      # 削除ボタンを確認する
      expect(page).to have_no_content '削除'
    end
    it 'ログインしていないと削除できない' do
      # 詳細ページへ
      visit charter_path(@charter2)
      # 削除ボタンを確認する
      expect(page).to have_no_content '削除'      
    end
  end
end
