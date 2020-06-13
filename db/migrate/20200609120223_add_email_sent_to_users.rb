class AddEmailSentToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email_sent, :string, default: 0
  end
end
