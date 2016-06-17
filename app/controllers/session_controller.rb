class SessionController < ApplicationController
  skip_before_action :authorize_user, only: [:login, :create]

  def login
  end

  def create
    session_params = params
    user = User.where(email: session_params[:email]).first

    if user.try(:authenticate, session_params[:password]) # user.authenticate(session_params[:password])
      flash[:success] = 'Logged in successfully'
      session[:user_id] = user.id

      redirect_to root_path
    else
      flash[:error] = 'Invalid credentials'

      render :login
    end
  end

  def logout
    session[:user_id] = nil

    redirect_to root_path
  end
end
