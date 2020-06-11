class AddEmailSentToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :email_sent, :string, default: 0
  end
end
