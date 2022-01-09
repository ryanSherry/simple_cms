class AdminUsersController < ApplicationController

  layout 'admin'

  def index
    @adminusers = AdminUser.sorted
  end

  def new
    @adminuser = AdminUser.new
  end

  def create
    @adminuser = AdminUser.new(admin_user_params)
    if @adminuser.save
      flash[:notice] = "Admin User Created Successfully."
      redirect_to(admin_users_path)
    else
      render('new')
    end
  end

  def edit
    @adminuser = AdminUser.find(params[:id])
  end

  def update
    @adminuser = AdminUser.find(params[:id])
    if @adminuser.update(admin_user_params)
      flash[:notice] = "Updated Admin User Successfully"
      redirect_to(admin_users_path)
    else
      render('edit')
    end
  end

  def delete
    @adminuser = AdminUser.find(params[:id])
  end

  def destroy
    @adminuser = AdminUser.find(params[:id])
    @adminuser.destroy
    flash[:notice] = "Admin User Destroyed Successfully"
    redirect_to(admin_users_path)
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :username, :email, :password)
  end
end
