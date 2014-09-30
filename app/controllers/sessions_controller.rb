class SessionsController < ApplicationController
 
	def new
	end
	def create

				@user = User.where(fullname: params[:fullname]).first
				if @user && @user.email == params[:email] # are you signing in with a name and email?
					session[:user_id] = @user.id
					flash[:notice] = "Successfully signed in!"
					redirect_to home_path
				end
				
				# from my class file for a user with email and password attributes
				 # @user = User.where(email: params[:email]).first
				 # if @user && @user.password == params[:password]
				    # session[:user_id] = @user.id
				    # flash[:notice] = "Successfully signed in."
				    # redirect_to home_path
			         # end

	end



	def destroy
		session[:user_id] = nil
		flash[:notice] = "Successfully signed out."
		redirect_to home_path
	end

	# the current_user method and helper should be in the ApplicationController 
	# so that it is available to all parts of the app
	# here it is only available to user routes
	  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
