class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|

      t.timestamps
    end
  end
end
