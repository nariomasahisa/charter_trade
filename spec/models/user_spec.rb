require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '必要な値が入力されていると新規登録ができる' do
      expect(@user).to be_valid
    end
    it 'Usernameが空だと登録できない' do
      @user.username = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Username can't be blank")
    end
    it 'Emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'Emailが一度登録されているものだと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
    end
    it 'Emailに@が含まれていないと登録できない' do
      @user.email = "aaaaaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードが8文字以上でないと登録できない' do
      @user.password = "tanaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
    it '確認用のパスワードとパスワードが一致しないと登録できない' do
      @user.password_confirmation = "Something123"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '電話番号が空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it '電話番号が全角だと登録できない' do
      @user.phone_number = "０９０５５５５９９９９"
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号に「-」が入っていると登録できない' do
      @user.phone_number = "090-1111-00"
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number is invalid")
    end
    it '都道府県が空だと登録できない' do
      @user.prefecture_address = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture address can't be blank")
    end
    it '市区町村が空だと登録できない' do
      @user.city_address = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("City address can't be blank")
    end
    it '番地までの住所が空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
