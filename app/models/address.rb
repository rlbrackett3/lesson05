class Address < ActiveRecord::Base
	has_many :user_addresses
	has_many :useers, through: :user_addresses
end