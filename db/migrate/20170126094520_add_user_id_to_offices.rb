class AddUserIdToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :user_id, :integer
  end
end
