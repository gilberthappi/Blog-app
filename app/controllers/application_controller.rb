class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user = current_user
  end

  def current_user
    User.first
  end
end
