class UsersController < ApplicationController
	def index
		@user = User.all

		# if @users_present?# if current_user #@users_present?
  #         flash[:notice] = "Users present and accounted for."
  #       else
  #         flash[:alert] = "Sorry, there are no users to display."
  #       end
	end

	def show
		@user = User.find(params[:id])
	end	

	def new
		@user = User.new
	end	

	def edit
		@user = User.find(params[:id])
	end


	def create
    
		@user = User.new(params[:user])
		if @user.save
				flash[:notice] = "Your account was was created successfully"
			redirect_to user_path(@user)
	    else
		    	flash[:alert] = "There was a problem creating your user"
	        redirect_to new_user_path
        end

	end

	def update
        @user = User.find(params[:id])
        if @user.update(params[:user])
			flash[:notice] = "User successfully updated!"
			redirect_to user_path @user
		else
			flash[:alert] = "User not updated, sorry."
			redirect_to edit_user_path
		end
	end	



	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:notice] = "User deleted!"
		else
			flash[:alert] = "There was a problem deleting the user."
		end
		redirect_to users_path
	end
	# def users_params
	# 	params.require(:user).permit(:fullname, :email)
	# end
end