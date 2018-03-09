class ChangeCarrerStudentUser < ActiveRecord::Migration[5.1]
  def change
  	rename_column :user_students, :carrer, :career
  end
end
