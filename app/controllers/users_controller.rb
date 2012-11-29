class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(params[:user])
    if (@user.save)
      flash[:success] = "Welcome to the Coop! Thanks for joining"
      redirect_to @user
    else
      render 'new'
    end
  end
  
end
