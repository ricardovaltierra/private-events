class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    log_out if current_user
    redirect_to root_path
  end
end
