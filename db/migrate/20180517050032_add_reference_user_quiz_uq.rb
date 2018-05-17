class AddReferenceUserQuizUq < ActiveRecord::Migration[5.1]
  def change
  	add_reference :user_quizzes, :user, foreign_key: true
  	add_reference :user_quizzes, :quiz, foreign_key: true
  end
end
