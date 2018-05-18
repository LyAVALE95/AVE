class AddSessionsDetaildescription < ActiveRecord::Migration[5.1]
  def change
  	change_column :session_details,:txt3, :text, :limit => 4294967295 
  end
end
