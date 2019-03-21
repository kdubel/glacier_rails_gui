class UserPanel::GlaciersController < UserPanelController

  def show_by_name
    @vault_name = params[:vault_name]
    @current_jobs = AwsGlacierService.new(current_user.id).list_jobs(@vault_name, params[:region_name])
  end

end