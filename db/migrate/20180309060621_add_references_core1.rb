class AddReferencesCore1 < ActiveRecord::Migration[5.1]
  def change
  	add_reference :user_students, :user, foreign_key: true
  	add_reference :user_teachers, :user, foreign_key: true
  	add_reference :users, :school, foreign_key: true
  	#add_reference :users, :group, foreign_key: true
  	add_reference :algorithms, :amethod, foreign_key: true
  	add_reference :sessions, :algorithm, foreign_key: true
  	add_reference :session_details, :session, foreign_key: true
  	add_reference :consultations, :session, foreign_key: true
  	add_reference :quizzes, :session, foreign_key: true
  	add_reference :questions, :quiz, foreign_key: true
  	add_reference :question_options, :question, foreign_key: true
  end
end
