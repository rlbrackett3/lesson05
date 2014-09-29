class SessionsController < ApplicationController
 
	def new
	end
	def create

				@user = User.where(fullname: params[:fullname]).first
				if @user && @user.email == params[:email]
					session[:user_id] = @user.id
					flash[:notice] = "Successfully signed in!"
					redirect_to home_path
				end

	end



	def destroy
		session[:user_id] = nil
		flash[:notice] = "Successfully signed out."
		redirect_to home_path
	end

	  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end