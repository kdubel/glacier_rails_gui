class CreateAwsAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :aws_accounts do |t|
      t.string :aws_id
      t.string :aws_secret

      t.timestamps
    end
  end
end
