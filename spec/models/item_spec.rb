require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it "全ての値が正しく入力されていれば出品できる" do
      expect(@item).to be_valid
    end
    it "画像は1枚必須であること(ActiveStorageを使用すること)" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が必須であること" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が必須であること" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it "カテゴリーの情報が必須であること" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "カテゴリーの情報が未選択ではないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it "商品の状態についての情報が必須であること" do
      @item.quality_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Quality can't be blank")
    end
    it "商品の状態についての情報が未選択ではないこと" do
      @item.quality_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Quality must be other than 0")
    end
    it "配送料の負担についての情報が必須であること" do
      @item.postage_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end
    it "配送料の負担についての情報が未選択ではないこと" do
      @item.postage_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 0")
    end
    it "発送元の地域についての情報が必須であること" do
      @item.shipping_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank")
    end
    it "発送元の地域についての情報が未選択ではないこと" do
      @item.shipping_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping must be other than 0")
    end
    it "発送までの日数についての情報が必須であること" do
      @item.day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day can't be blank")
    end
    it "発送までの日数についての情報が未選択ではないこと" do
      @item.day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 0")
    end
    it "価格についての情報が必須であること" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格の範囲が、¥300未満で出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it "価格の範囲が、¥9,999,999以上で出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it"販売価格は半角数字のみ保存可能であること" do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
  end
end