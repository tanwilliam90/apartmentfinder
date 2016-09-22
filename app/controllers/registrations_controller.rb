class RegistrationsController < Devise::RegistrationsController
  def create
    super
    @user = User.last
    @user.add_role(:owner)
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
