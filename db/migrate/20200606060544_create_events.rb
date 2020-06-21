class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :genre_id, null: false
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :text, null: false
      t.decimal :value, precision: 12, scale: 2
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
