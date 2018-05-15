class ChangeTypeSchool < ActiveRecord::Migration[5.1]
  def change
  	rename_column :schools, :type, :typeSchool
  end
end
