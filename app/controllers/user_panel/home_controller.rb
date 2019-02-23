class UserPanel::HomeController < UserPanelController

  def index

  end

  def settings
    @account = AwsAccount.find_by_user_id(current_user.id)
  end

  def save_settings
    bbb
  end
end