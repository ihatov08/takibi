class CreateProjectPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :project_plans do |t|
      t.integer :price, null: false
      t.text :description, null: false
      t.references :project, null: false, foreign_key: true
      t.date :esitimate_delivery_date, null: false
      t.boolean :limited_amount, null: false, default: false
      t.boolean :email_required, null: false, default: false
      t.boolean :shipping_info_required, null: false, default: false
      t.boolean :private_comment_required, null: false, default: false
      t.timestamps
    end
  end
end
