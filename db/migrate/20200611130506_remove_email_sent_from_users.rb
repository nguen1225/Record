class RemoveEmailSentFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email_sent, :string
  end
end
