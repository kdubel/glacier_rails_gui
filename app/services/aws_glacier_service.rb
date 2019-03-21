class AwsGlacierService < AwsService

  include ActionView::Helpers::NumberHelper


  def get_job_output_data(vault_name, job_id)
    client = Aws::Glacier::Client.new(credentials: self.credentials, region: region_name)
    return client.get_job_output({job_id: job_id, vault_name: vault_name}).to_h.body
  end

  def delete_archive()

  end

  def delete_all_archives(inventory_job_id, vault_name)

  end

  def list_vaults(region_name)
    client = Aws::Glacier::Client.new(credentials: self.credentials, region: region_name)
    vaults = client.list_vaults.vault_list
    return vaults.map do |v| {
        name: v.vault_name,
        created_at: v.creation_date.try(:strftime, "%d-%m-%Y %H:%M:%S %Z"),
        updated_at: v.last_inventory_date.try(:strftime, "%d-%m-%Y %H:%M:%S %Z"),
        archives_no: v.number_of_archives,
        size: number_to_human_size(v.size_in_bytes)}
    end
  end

  def list_jobs(vault_name, region_name)
    client = Aws::Glacier::Client.new(credentials: self.credentials, region: region_name)
    jobs = client.list_jobs(vault_name: vault_name).job_list
    return jobs.map{|j| {name: j.action, status: j.status_code, completed: j.completed, created_at: j.creation_date}}
  end

  def initiate_inventory_retrival(vault_name, region_name)
    client = Aws::Glacier::Client.new(credentials: self.credentials, region: region_name)
    resp = client.initiate_job({
                                   vault_name: vault_name,
                                   job_parameters: {
                                       description: 'Inventory retrival by Glacier GUI',
                                       type: 'inventory-retrieval'
                                   }
                               })
    return resp.job_id
  end

end