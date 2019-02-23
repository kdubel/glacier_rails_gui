class CreateGlacierVaultElements < ActiveRecord::Migration[5.2]
  def change
    create_table :glacier_vault_elements do |t|
      t.integer :glacier_job_id
      t.string :name

      t.timestamps
    end
  end
end
