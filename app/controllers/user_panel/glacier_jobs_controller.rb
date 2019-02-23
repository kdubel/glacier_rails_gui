class UserPanel::GlacierJobsController < UserPanelController

  def index
    @glacier_jobs = current_user.glacier_jobs
  end

  def show
    @glacier_job = GlacierJob.find(:id)
  end

  def new

  end

  def create

  end

end