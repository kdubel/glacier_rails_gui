class AddStatusToGlacierJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :glacier_jobs, :status, :string
  end
end
