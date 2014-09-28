class AddressesController < ApplicationController
	def index
		@address = Address.all
	end
	def create
		@address = Address.new(addresses_params)
		@address.save
		redirect_to address_path(@address)
	end
	def show
		@address = Address.find(params[:id])
	end
	def destroy
		@address = Address.find(params[:id])
		if @address.destroy
			flash[:notice] = "Address deleted!"
		else
			flash[:alert] = "There was a problem deleting the address."
		end
		redirect_to addresses_path
	end
	def addresses_params
		params.require(:address).permit(:number, :street, :city)
	end
end