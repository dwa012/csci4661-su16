class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorize_user

  helper_method :current_user

  def current_user
    User.where(id: session[:user_id]).first
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def authorize_user
    if current_user.nil?
      flash[:error] = 'Must be logged in to continue'
      redirect_to root_path
    end
  end
end
