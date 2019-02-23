class AddUserIdToAwsAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :aws_accounts, :user_id, :integer
  end
end
