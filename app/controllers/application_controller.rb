# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :current_user
  before_filter :set_locale

  def current_user
    if session[:member_id]
      begin
        @current_user ||= Member.find(session[:member_id])
        flash[:success] = "Du er logget inn som #{@current_user.firstname} #{@current_user.surname}"
      rescue
        end
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end
