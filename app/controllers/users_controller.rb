class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => "Not authorized as an administrator."
    @users = User.all

    respond_to do |format|
      format.html
      format.csv do
        headers["Content-Disposition"] = "attachment; filename=\"florileges-prairies-export-users.csv\""
        headers["Content-Type"] ||= "text/csv"
      end
      format.xlsx
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    authorize! :update, @user, :message => "Not authorized as an administrator."
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize! :destroy, @user, :message => "Not authorized as an administrator."
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def generate_new_password_email
    user = User.find(params[:user_id])
    user.send_reset_password_instructions
    flash[:notice] = "Les instructions de réinitialiation du mot de passe ont transmises à #{user.email}."
    redirect_to admin_user_path(user)
  end
end
