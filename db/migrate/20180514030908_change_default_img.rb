class ChangeDefaultImg < ActiveRecord::Migration[5.1]
  def change
  	change_column :user_teachers, :avatarn, :string, default:"/avatar_teacher/052-man-24.png"
  	change_column :user_students, :avatarn, :string, default:"/avatar_student/boy.png"
  end
end
