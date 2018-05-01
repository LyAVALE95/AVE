class CreateUserStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :user_students do |t|
    	t.string :names
    	t.string :lastnames
    	t.string :name
    	t.string :control_number
    	t.string :carrer
    	t.string :grade
    	t.string :algorithm_level
    	t.string :course_level
    	t.string :score
      t.timestamps
    end
  end
end
