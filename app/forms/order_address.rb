class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_id, :municipality, :house_number, :building_name, :phone_number, :token, :price, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_id
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
  end
  validates :token, presence: true
  validates :shipping_id, numericality: { other_than: 0 }
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_id: shipping_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end