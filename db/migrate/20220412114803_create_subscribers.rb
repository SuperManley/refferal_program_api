class CreateSubscribers < ActiveRecord::Migration[6.1]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :share_key
      t.string :user_key
      t.string :street_address_one
      t.string :street_address_two
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :prize_sent
      t.boolean :sent_to_fulfillment
        t.references :referrer, index: true
      t.timestamps
    end
  end
end
