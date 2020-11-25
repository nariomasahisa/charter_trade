require 'rails_helper'

RSpec.describe "価格投稿", type: :system do
  before do
    @sell = FactoryBot.build(:sell)
    @charter1 = FactoryBot.create(:charter)
    @charter2 = FactoryBot.create(:charter)
    @user = FactoryBot.create(:user)
  end

  it 'チャーターの発注者出なければ売値を提示できる' do
    # ログイン
    visit new_user_session_path
    fill_in 'Email', with: @charter1.user.email
    fill_in 'Password', with: @charter1.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # 詳細ページへ
    visit charter_path(@charter2)
    # フォームに入力
    fill_in :content, with: @sell.sell
    # クリック
    expect{
      find('input[name="commit"]').click
    }.to change { Sell.count }.by(1)
    expect(current_path).to eq charter_path(@charter2)
    # 売値削除
    # expect {
    #   find_link('削除',href: charter_sell_path(@charter.sell)).click
    # }.to change { Sell.count }.by(-1)
  end
  it 'チャーター発注者は売値を提示できない' do
    # ログイン
    visit new_user_session_path
    fill_in 'Email', with: @charter1.user.email
    fill_in 'Password', with: @charter1.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # 詳細ページへ
    visit charter_path(@charter1)
    # フォームがない
    expect(page).to have_no_selector 'form'
  end
  it 'ログインしていないと売値を提示できない' do
    # 詳細ページへ
    visit charter_path(@charter1)
    # フォームがない
    expect(page).to have_no_selector 'form'
  end
end
