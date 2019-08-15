class CreateUserShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_shipping_addresses do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.integer :city_id, null: false
      t.string :line_1, null: false
      t.string :line_2

      t.timestamps
    end
  end
end
