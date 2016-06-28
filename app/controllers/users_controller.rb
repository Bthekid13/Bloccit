class UsersController < ApplicationController


  def new
  @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to Bloccit."
      create_session(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "Sorry, there was an error. Please try again."
      render :new
    end
  end

  def confirm
    @user = User.new(user_params)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
