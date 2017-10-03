class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credientials(params[:user][:username], [:user][:password])
    if @user
      log_in(@user)
    else
      flash.now[:errors] = ["Invalid credientials"]
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end
