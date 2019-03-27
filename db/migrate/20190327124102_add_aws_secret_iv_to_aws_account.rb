class AddAwsSecretIvToAwsAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :aws_accounts, :encrypted_aws_secret_iv, :string
  end
end
