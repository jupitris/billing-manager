class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :office_name
      t.string :postal_code
      t.integer :country_id
      t.string :prefecture
      t.string :city
      t.string :address_line1
      t.string :address_line2
      t.string :phone_number
      t.string :fax_number
      t.string :owner_name
      t.integer :delete_flg
      t.integer :created_by
      t.datetime :created_at
      t.integer :updated_by
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
