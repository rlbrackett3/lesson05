class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :number
      t.string :street
      t.string :city
      t.integer :user_id
    end
  end
end
