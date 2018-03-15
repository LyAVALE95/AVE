class AddUserRoleActivePro < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :rol, :string, :limit => 30, default:"student"
  	add_column :users, :active, :boolean, default: 0
  	add_column :users, :pro, :boolean, default: 0
  end
end
