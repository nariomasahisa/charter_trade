require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規投稿できるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      #トップページにいく
      visit root_path
      #新規登録ボタンを確認する
      expect(page).to have_content('新規登録')
      #新規登録ボタンをクリックして新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'アカウント名', with: @user.username
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード<確認用>', with: @user.password_confirmation
      fill_in '電話番号', with: @user.phone_number
      fill_in '都道府県', with: @user.prefecture_address
      fill_in '市区町村', with: @user.city_address
      fill_in '番地までの住所', with: @user.house_number
      #アカウントを作成ボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      #トップページへ戻る
      expect(current_path).to eq root_path
      #ログアウトボタンがある
      expect(page).to have_content('ログアウト')
      #新規登録ページやログインページへ遷移するボタンがない
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('新規登録')
    end
  end
  context 'ユーザー新規投稿できないとき' do
    it '誤った情報を入力すれば新規登録できずに新規登録ページへ戻る' do
      # トップページへ
      visit root_path
      # 新規登録ボタンの確認
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動
      visit new_user_registration_path
      # ユーザー情報を入力
      fill_in 'アカウント名', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワード<確認用>', with: ''
      fill_in '電話番号', with: ''
      fill_in '都道府県', with: ''
      fill_in '市区町村', with: ''
      fill_in '番地までの住所', with: ''
      # 作成ボタンを押してもUserモデルのカウントは増えない
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻される
      expect(current_path).to eq "/users"

    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインできるとき' do
    it '保存されているユーザーの情報と一致すればログインできる' do
      # トップページに移動する
      visit root_path
      # ログインボタンがある
      expect(page).to have_content('新規登録')
      # ログインページへ遷移する
      visit new_user_session_path
      # ログイン情報を入力する
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      # ログインボタンをクリックする
      find('input[name="commit"]').click
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # ログアウトボタンがある
      expect(page).to have_content('ログアウト')
      # ログインボタンや新規登録ボタンがない
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('新規登録')
    end
  end
  context '保存されているユーザーの情報と一致しなければログインできない' do
    it '保存されているユーザーの情報と一致しないとログインできない' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_session_path
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      find('input[name="commit"]').click
      expect(current_path).to eq new_user_session_path
    end
  end
end

