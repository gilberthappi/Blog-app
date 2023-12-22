class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :string
    add_column :users, :AddRoleToUsers, :string
    add_column :users, :role, :string
    add_column :users, :AddProfileToUsers, :string
    add_column :users, :profile, :string
  end
end
