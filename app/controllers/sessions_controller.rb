class SessionsController < ApplicationController
 
	def new
	end
	def create
		@user = User.where(fullname: params[:fullname]).first
		if @user && @user.email == params[:email]
			session[:user_id] = @user_id
			flash[:notice] = "Successfully signed in!"
			redirect_to home_path
		end
	end



	def destroy
		session[:user_id] = nil
		flash[:notice] = "Successfully signed out."
		redirect_to home_path
	end
end