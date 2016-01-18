class ApplicationController < ActionController::Base
  protect_from_forgery
  def check_privileges!
  redirect_to "/", notice: 'You dont have enough permissions to be here' unless current_user.present?
end
end
