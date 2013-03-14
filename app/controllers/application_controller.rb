class ApplicationController < ActionController::Base
	protect_from_forgery

	# force_ssl 	# uncomment to force browser to https
	# or put the following line in config/application.rb
	# config.force_ssl = true

	def authorize 
		redirect_to login_url, alert: "Not authorized" if current_user.nil?
	end

	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

end
