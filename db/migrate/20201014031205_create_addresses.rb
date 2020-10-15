class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :postal_code,        null: false
      t.integer :shipping_id,        null: false
      t.string  :municipality,       null: false
      t.string  :house_number,       null: false
      t.string  :building_name
      t.string  :phone_number,       null: false
      t.integer :order_id,           null: false
      t.timestamps
    end
  end
end
