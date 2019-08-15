class CreateStripeCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :stripe_credit_cards do |t|
      t.string :token, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
