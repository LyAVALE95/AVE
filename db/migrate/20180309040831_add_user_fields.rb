class AddUserFields < ActiveRecord::Migration[5.1]
  def change
  		add_column :users, :names, :string, :limit => 30, default:"Names"
    	add_column :users, :lastnames, :string, :limit => 30, default:"Lastname" 
    	add_column :users, :name, :string, :limit => 60, default:"Name"
    	add_column :users, :control_number, :string, default:"123456789"
    	add_column :users, :carrer, :string, :limit => 30, default:"Carrer"
    	add_column :users, :grade, :string, :limit => 30, default:"0"
    	add_column :users, :algorithm_level, :string, :limit => 30, default:"0"
    	add_column :users, :course_level, :string, :limit => 30, default:"0"
    	add_column :users, :score, :string, :limit => 30, default:"0"
  end
end
