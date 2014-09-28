class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :email
      t.integer :address_id
      t.integer :post_id
    end
  end
end
