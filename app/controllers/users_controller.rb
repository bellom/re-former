#user controller
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user = params['user']
    @user = User.new(username: new_user['username'], email: new_user['email'], password: new_user['password'])
    # username: params["username"], email: params["email"], password: params["password"]
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

    
    def update
        edit_user = params["user"]
        @user = User.find(params[:id])
        status = @user.update(username: edit_user["username"], email:edit_user["email"], password:edit_user["password"])
        if status
            redirect_to new_user_path
        else
            render :edit
        end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
