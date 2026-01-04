class BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_tenant
  
  helper_method :current_tenant

  private

  def set_current_tenant
    @current_tenant = current_user.tenant
  end

  def current_tenant
    @current_tenant
  end
end