class AddUsrShortcutsGroup < ActiveRecord::Migration[5.1]
  def change
  	add_reference :user_students, :group, foreign_key: true
  	add_reference :user_students, :school, foreign_key: true
  	add_reference :user_students, :user_teacher, foreign_key: true
  end
end
