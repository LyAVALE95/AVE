class CreateExercises < ActiveRecord::Migration[5.1]
  def change
    create_table :exercises do |t|    	
      t.timestamps
    end
    add_reference :exercises, :user_students, foreign_key: true
    add_reference :exercises, :user_teachers, foreign_key: true
  end
end
