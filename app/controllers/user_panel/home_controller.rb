class UserPanel::HomeController < UserPanelController

  def index

  end

  def settings
    @account = AwsAccount.find_by_user_id(current_user.id)
  end

  def save_settings
    @account = AwsAccount.find_by_user_id(current_user.id)
    if @account.update_attributes(account_params)
      redirect_to root_path
    else
      flash[:notice] = 'Error'
      render action: :settings
    end
  end

  private
  def account_params
    params.require(:aws_account).permit(:aws_id, :aws_secret)
  end
end