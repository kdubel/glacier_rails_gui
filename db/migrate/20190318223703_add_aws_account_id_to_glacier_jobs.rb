class AddAwsAccountIdToGlacierJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :glacier_jobs, :aws_account_id, :integer
  end
end
