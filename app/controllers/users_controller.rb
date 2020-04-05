class UsersController < ApplicationController
  before_action :set_user
  
  def index
    redirect_to root_path
  end

  def show
    @pagy, @gifs = pagy(@user.gifs.includes(:tags, :user), items: 5)
  end

  private
  def set_user 
    @user = User.find(params[:id])
  end
end