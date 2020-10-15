require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    it "全ての値が正しく入力されていれば購入できる" do
      expect(@order_address).to be_valid
    end
    it "クレジットカード情報が空では購入できない" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号が空ではないこと"do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it "郵便番号にハイフンが必要であること" do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end
    it "都道府県の情報が必須であること" do
      @order_address.shipping_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping can't be blank")
    end
    it "都道府県の情報が未選択ではないこと" do
      @order_address.shipping_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping must be other than 0")
    end
    it "市区町村が空ではないこと" do
      @order_address.municipality = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it "番地が空ではないこと" do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it "建物名は空でも購入できる" do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
    it "電話番号が空ではないこと" do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号が11桁以内であること" do
      @order_address.phone_number = "090123456789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it "電話番号にハイフンがないこと" do
      @order_address.phone_number = "090-1234-5678"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end