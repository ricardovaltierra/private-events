class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @events_created = current_user.created_events
    @events_attended = current_user.attended_events
    @past_events = @events_attended.where('date < ?', Time.now)
    @upcoming_events = @events_attended.where('date > ?', Time.now)
  end

  private

  def user_param
    params.require(:user).permit(:username)
  end
end
