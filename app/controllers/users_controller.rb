class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:destroy]

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(params[:user])
    if (@user.save)
      sign_in @user
      flash[:success] = "Welcome to the Coop! Thanks for joining"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render "edit"
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    unless User.find_by_id(params[:id])
      flash[:success] = "User removed"
      redirect_to recipes_path
    else
      flash[:error] = "User could not be removed"
    end
  end
    
  
=begin
  def destroy
    flash[:param_id] = params[:id]
    flash[:user_id] = current_user.id
    if admin_user
      User.find(params[:id]).destroy
      flash[:success] = "User removed"
    elsif current_user.id == params[:id].to_i
      flash[:destroy_return] = User.find_by_id(current_user.id).destroy
      flash[:current_user] = current_user
      if current_user.destroyed?
        flash[:success] = "You have successfully removed yourself"
      else
        flash[:error] = "User could not be removed"
      end
    else
      flash[:error] = "Can not remove user without administrative privileges"
    end
    redirect_to recipes_path
  end
=end
  
  private
  
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
