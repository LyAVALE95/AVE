class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :description
      t.integer :approved
      t.boolean :avaible

      t.timestamps
    end
  end
end
