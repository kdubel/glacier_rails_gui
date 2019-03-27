class AddEncryptedAwsSecretToAwsAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :aws_accounts, :encrypted_aws_secret, :string
    remove_column :aws_accounts, :aws_secret
  end
end
