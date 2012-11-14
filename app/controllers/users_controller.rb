class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to login_path, :notice => "signed up!"
    else
      render "new"
    end
  end
  
  def show
    @user = User.find(params[:id])
    render "index"
  end
  
  def index
    @user = User.find(params[:id])
    @urls = Url.find_all_by_user_id(@user.id)
  end
  
end
