class UserPanel::GlacierJobsController < UserPanelController

  def index
    @glacier_jobs = current_user.glacier_jobs
  end

  def show
    @glacier_job = GlacierJob.find(:id)
  end

  def new
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

end