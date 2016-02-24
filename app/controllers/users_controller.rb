class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :edit_password, :update_password]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "User Created!"
    else
      flash[:notice] = "User not created"
      render :new
    end
  end

  def edit
  end

  def edit_password
  end

  def show
  end

  def update
    if @user.update user_params
      redirect_to(root_path, {notice: "User updated!"})
    else
      render :edit
    end
  end

  def update_password
    if valid_pass?
      if @user.update user_params
        redirect_to(root_path, {notice: "Password updated!"})
      else
        render :edit_password
      end
    else
      render :edit_password
    end
  end

  private

  def user_params
    # using params. require ensures that there is a key called `question` in my
    # params. the `permit` method will only allow paramsters that you explicitly
    # list, in this case: title and body
    # this is called Strong Paramters
    params.require(:user).permit([:first_name, :last_name, :email, :password, :password_confirmation])
  end

  def find_user
    @user = User.find params[:id]
  end

  def valid_pass?
    check_password = @user.authenticate(params[:user][:current_password])
    if (params[:user][:current_password] != params[:user][:password]) && check_password
      true
    else
      flash[:notice] = "Invalid password combination"
      false
    end
  end

end
