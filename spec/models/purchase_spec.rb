require 'rails_helper'

RSpec.describe PurchasesStreetAddress, type: :model do

  describe '商品購入機能' do
    before do
      @purchases = FactoryBot.build(:PurchasesStreetAddress)
    end

    # 1
    it "tokenが空では登録できないこと" do
      @purchases.token = nil
      @purchases.valid?
      expect(@purchases.errors.full_messages).to include("Token can't be blank")
    end

    # 2
    it 'postal_codeが空では登録できない' do
      @purchases.postal_code = nil
      @purchases.valid?
      expect(@purchases.errors.full_messages).to include("Postal code can't be blank")
    end

    # 3
    it 'prefectures_idが空では登録できない' do
      @purchases.prefectures_id = nil
      @purchases.valid?
      expect(@purchases.errors.full_messages).to include("Prefectures can't be blank")
    end

    # 4
    it 'municipalityが空では登録できない' do
      @purchases.municipality = nil
      @purchases.valid?
      expect(@purchases.errors.full_messages).to include("Municipality can't be blank")
    end

    # 5
    it 'addressが空では登録できない' do
      @purchases.address = nil
      @purchases.valid?
      expect(@purchases.errors.full_messages).to include("Address can't be blank")
    end

    # 6
    it 'phone_numberが空では登録できない' do
      @purchases.phone_number = nil
      @purchases.valid?
      expect(@purchases.errors.full_messages).to include("Phone number can't be blank")
    end

    # 7
    it 'postal_codeにハイフンがついていないと購入できない' do
      @purchases.postal_code = 1231234
      @purchases.valid?
      expect(@purchases.errors.full_messages).to include("Postal code is invalid. ")
    end

    # 7
    it 'postal_codeは全角で入力すると購入できない' do
      @purchases.postal_code = '１２３−４５６７'
      @purchases.valid?
      expect(@purchases.errors.full_messages).to include("Postal code is invalid. ")
    end

    # 8
    it 'prefectures_idのIDが０だと購入できない' do
      @purchases.prefectures_id = 0
      @purchases.valid?
      expect(@purchases.errors.full_messages).to include("Postal code is invalid. ")
    end

    # 9
    it 'phone_numberが全角で入力していた場合、購入できない' do
      @purchases.phone_number = '０９０３３３３６６６６'
      @purchases.valid?
      expect(@purchases.errors.full_messages).to include("Phone number is invalid.")
    end

    # 10
    it 'phone_numberにハイフンをつけていた場合、購入できない。' do
    
      @purchases.phone_number = "090-3333-6666"
      @purchases.valid?
      binding.pry
      expect(@purchases.errors.full_messages).to include("Phone number is invalid.")
    end
  end
  
end
