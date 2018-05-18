class ChangeDescriptionType < ActiveRecord::Migration[5.1]
  def change
  	change_column :amethods,:description, :text, :limit => 4294967295 
  end
end
 