class Manager::UsersController < BaseController
  def index; end
  def new
    @user = @current_tenant.users.new
  end
  def create; end
  def update; end

end