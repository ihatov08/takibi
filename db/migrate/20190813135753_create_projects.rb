class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :target_price, null: false, default: 0
      t.datetime :ended_at, null: false
      t.integer :success_condition, null: false, default: 0
      t.string :title, null: false
      t.text :short_blurb, null: false
      t.references :category, foreign_key: true, null: false
      t.string :video_url
      t.text :body, null: false

      t.timestamps
    end
  end
end
