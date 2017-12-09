class CreateUserInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :user_name
      t.string :phone_number
      t.string :mail_address
      t.string :home_adress

      t.timestamps
    end
  end
end
