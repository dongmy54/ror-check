class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_require
    if !current_user.admin?
      	  redirect_to "/", alert: "亲，你还不是管理员哦！"
    end  	
  end

end
