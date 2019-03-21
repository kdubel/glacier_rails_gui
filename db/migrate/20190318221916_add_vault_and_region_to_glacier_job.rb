class AddVaultAndRegionToGlacierJob < ActiveRecord::Migration[5.2]
  def change
    add_column :glacier_jobs, :vault_name, :string
    add_column :glacier_jobs, :region_name, :string
  end
end
