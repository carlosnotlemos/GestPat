class Manager::UsersController < BaseController
  DEFAULT_PASSWORD = "@##@@##@"
  def index
    @users = @current_tenant.users
  end
  def new
    @user = @current_tenant.users.new
  end
  def create
    @user = @current_tenant.users.new(user_params)

    if @user.save
      redirect_to [:manager, :users], notice: "Usuário cadastrado com sucesso!"
    else
      flash['alert'] = @user.errors.full_messages.join(', ')
      render :new, status: :unprocessable_content
    end
  end
  def update; end

  private

  def user_params
    params.require(:user).permit(
      :name, :email, :role
    ).merge(
      tenant: @current_tenant,
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end
end