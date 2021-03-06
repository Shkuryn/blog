class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def index

  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    # Не окончательная реализация!
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
