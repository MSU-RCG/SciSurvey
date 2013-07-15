class UserRolesController < ApplicationController
  def index
    @users = User.all
  end

  def add
    @users = User.all
    @roles = Role.all
  end
  
  def create
    user = User.find(params[:user])
    role = Role.find(params[:role])
    user.roles << role
     respond_to do |format|
        if user.save
          format.html { redirect_to user_roles_path, notice: 'Role was successfully added.' }
        else
          format.html { render action: "add" }
          format.json { render json: user.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    user = User.find(params[:user])
    role = Role.find(params[:role])
    user.roles.delete(role)
    redirect_to user_roles_path
  end
end
