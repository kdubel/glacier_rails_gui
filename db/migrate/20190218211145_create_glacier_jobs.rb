class CreateGlacierJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :glacier_jobs do |t|
      t.string :aws_job_id

      t.timestamps
    end
  end
end
