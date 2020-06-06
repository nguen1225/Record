class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :genre_id
      t.integer :user_id
      t.string :title
      t.text :text
      t.integer :value
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
