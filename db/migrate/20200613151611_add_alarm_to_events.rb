class AddAlarmToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :alarm, :boolean, default: false, null: false
  end
end
