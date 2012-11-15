# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base


  protect_from_forgery

  before_filter :set_locale
  before_filter :set_current_user_for_model_layer_access_control
  filter_access_to :all

  def permission_denied
    flash[:error] = "Du har ikke tilgang til denne siden"
    redirect_to root_path
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # Allows models to access the current user
  def set_current_user_for_model_layer_access_control
    Authorization.current_user = current_user
  end

  private

  def current_user
    if session[:member_id]
      # begin/rescue because user can be deleted while he's navigating the page
      begin
        @current_user = Member.find session[:member_id]
      rescue
        @current_user = nil
      end
    end
  end
end
