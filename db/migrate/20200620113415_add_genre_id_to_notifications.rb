class AddGenreIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :genre, foreign_key: true
  end
end
