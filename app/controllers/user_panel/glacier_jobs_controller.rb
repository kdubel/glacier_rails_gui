class UserPanel::GlacierJobsController < UserPanelController

  def index
    @glacier_jobs = current_user.glacier_jobs
  end

  def show
    @glacier_job = GlacierJob.find(:id)
  end

  def new
    unless current_user.has_aws_keys
      redirect_to user_panel_home_settings_path
    end
    @glacier_job = GlacierJob.new
    @regions = AwsService.new(current_user.id).get_all_regions
    @vaults = []
  end

  def create

  end

  def get_all_vaults
    begin
      render json: AwsGlacierService.new(current_user.id).list_vaults(params[:region])
    rescue Aws::Glacier::Errors::ServiceError => e
      render json: {
          text: e,
          status: 500
      }
    end
  end

  def schedule_new_job
    job = GlacierJob.new
    service = AwsGlacierService.new(current_user.id)
    if params[:job_type] == 'full_deletion'
      job.aws_job_id = service.initiate_inventory_retrival(params[:name], params[:region])
      job.vault_name = params[:name]
      job.region_name = params[:region]
      job.aws_account = current_user.aws_account
      job.save!
    end
    redirect_to show_by_name_user_panel_glaciers_path({vault_name: params[:name], region_name: params[:region]})
  end

end