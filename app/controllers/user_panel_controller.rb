class UserPanelController < ApplicationController
  before_action :authenticate_user!

end