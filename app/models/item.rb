class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :quality
    belongs_to_active_hash :postage
    belongs_to_active_hash :shipping
    belongs_to_active_hash :day

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :category_id
    validates :quality_id
    validates :postage_id
    validates :shipping_id
    validates :day_id
    validates :price, inclusion: { in: 300..9_999_999, }
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :quality_id
    validates :postage_id
    validates :shipping_id
    validates :day_id
  end

end

