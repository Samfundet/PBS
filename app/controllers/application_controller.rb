# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :current_user

  def current_user
    if session[:member_id]
      @current_user ||= Member.find(session[:member_id])
      flash[:success] = "Du er logget inn som #{@current_user.id}"
    end
  end

end
