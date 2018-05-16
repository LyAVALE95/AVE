class AddQuizSessionTeacher < ActiveRecord::Migration[5.1]
  def change
  	add_reference :sessions, :user_teacher, foreign_key: true
  	add_reference :quizzes, :user_teacher, foreign_key: true
  end
end
