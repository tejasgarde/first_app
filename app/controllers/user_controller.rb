class UserController < ApplicationController
  def home
    @title = "Home"
    @users = User.all
  end
  def edit
    @title ="Edit User"
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "User is Updated"
      redirect_to @user
    else
      @title = "Update"
      redirect_to 'edit'
    end
  end
  def show
    @title ="Show"
    @user = User.find(params[:id])
  end

  def new
    @title = "New User"
    @user = User.new
  end
  def create
    @title = "New User"
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to 'home'
    end
  end

end
