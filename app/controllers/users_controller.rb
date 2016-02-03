class UsersController < ApplicationController


  def new
  @user = User.new
end

  def create
    @user = @user.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "Welcome to Bloccit."
      redirect_to root_path
    else
      flash.now[:alert] = "Sorry, there was an error. Please try again."
      render :new
    end
  end

  def update

  end

  def destroy

  end
