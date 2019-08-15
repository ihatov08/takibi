class CreateBackers < ActiveRecord::Migration[5.2]
  def change
    create_table :backers do |t|
      t.references :project_plan, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :donation, null: false, default: 0

      t.timestamps
    end
  end
end
