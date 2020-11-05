require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    #1
    it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、生年月日が存在すれば登録できること" do
      expect(@user).to be_valid
    end

    #2
    it "nicknameが空では登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    #3
    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    #4
    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    #5
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    #6
    it "重複したemailが存在する場合は登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    #7
    it "passwordが６文字以上で、半角英数字混合であれば登録できること" do
      @user.password 
      @user.password_confirmation
      expect(@user).to be_valid
    end

    #8
    it "passwordが６文字以上でも、半角英語のみでは登録できない" do
      @user.password = "yatuhashi"
      @user.password_confirmation = "yatuhashi"
      @user.valid?
      
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    #9
    it "passwordが６文字以上でも、数字のみでは登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    #10
    it "passwordが５文字以下であれば登録できないこと" do
      @user.password = "a1234"
      @user.password_confirmation = "a1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    #11
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    #12
    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    #13
    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    #14
    it "L_nameが空では登録できないこと" do
      @user.L_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("L name can't be blank")
    end

    #15
    it "F_nameが空では登録できないこと" do
      @user.F_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("F name can't be blank")
    end

    #16
    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    #17
    it "emailに@がないと登録できない" do
      @user.email = "aaaaaa.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  end

end
