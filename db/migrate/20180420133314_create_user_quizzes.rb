class CreateUserQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_quizzes do |t|
      t.float :score      
      t.timestamps
    end
      add_reference :user_students, :user_quiz, foreign_key: true
      #add_reference :user_teachers, :user_quiz, foreign_key: true
  end
end
