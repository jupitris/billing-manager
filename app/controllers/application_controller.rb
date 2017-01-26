class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD'] if Rails.env.staging?

  helper_method :has_office?, :own_office

private

  def has_office?
    @user = current_user

    if @user.persisted?
      Office.find_by(user_id: @user.id)
    end
  end

  def own_office
    @user = current_user

    if @user.persisted?
      @office = Office.find_by(user_id: @user.id)
    end
  end
end
