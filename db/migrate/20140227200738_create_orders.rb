class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :ip_address, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :card_type, null: false
      t.date :card_expires_on, null: false

      t.timestamps
    end
  end
end
