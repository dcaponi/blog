class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, :with => :resource_not_found
  helper_method :current_user, :logged_in?
  protected;
  def resource_not_found
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    if !logged_in?
      flash[:danger] = "You must be signed in to do that!"
      redirect_to root_path
    end
  end
end
