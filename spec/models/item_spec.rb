require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    # 1
    it 'image,name,explanation,category,product_condition,delivery_fee,shipment_source,day,selling_priceがあれば出品できる' do
      expect(@item).to be_valid
    end

    # 2
    it 'nameが空では登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    # 3
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    # 4
    it 'explanationが空では登録できない' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    # 5
    it 'categoryを選択していない場合は登録できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end

    # 6
    it 'product_conditionを選択していない場合は登録できないこと' do
      @item.product_condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Product condition must be other than 0')
    end

    # 7
    it 'delivery_feeを選択していない場合は登録できないこと' do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee must be other than 0')
    end

    # 8
    it 'shipment_sourceを選択していない場合は登録できないこと' do
      @item.shipment_source_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipment source must be other than 0')
    end

    # 9
    it 'dayを選択していない場合は登録できないこと' do
      @item.day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Day must be other than 0')
    end

    # 10
    it 'selling_priceが300円以下であれば登録できないこと' do
      @item.selling_price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
    end

    # 11
    it 'selling_priceが9,999,999円以上であれば登録できないこと' do
      @item.selling_price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
    end

    # 12
    it 'selling_priceが入力されていなければ登録できないこと' do
      @item.selling_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price can't be blank")
    end

    # 13
    it 'selling_priceが半角数字以外の場合、登録できないこと' do
      @item.selling_price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Selling price is not a number')
    end
  end
end
