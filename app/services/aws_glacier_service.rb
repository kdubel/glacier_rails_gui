class AwsGlacierService < AwsService

  include ActionView::Helpers::NumberHelper

  def get_available_vaults(region_name)

  end

  def list_current_jobs(vault_id)

  end

  def list_vaults(region_name)
    client = Aws::Glacier::Client.new(credentials: self.credentials, region: region_name)
    vaults = client.list_vaults.vault_list
    return vaults.map{|v| {name: v.vault_name, created_at: v.creation_date.strftime("%d-%m-%Y %H:%M:%S %Z"), updated_at: v.last_inventory_date.strftime("%d-%m-%Y %H:%M:%S %Z"), archives_no: v.number_of_archives, size: number_to_human_size(v.size_in_bytes)}}
  end

  def list_jobs(vault_name, region_name)
    client = Aws::Glacier::Client.new(credentials: self.credentials, region: region_name)
    jobs = client.list_jobs(vault_name: vault_name).job_list
    return jobs.map{|j| {name: j.action, status: j.status_code, completed: j.completed, created_at: j.creation_date}}
  end

end