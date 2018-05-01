class CreateQuestionOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :question_options do |t|
      t.integer :value
      t.text :description

      t.timestamps
    end
  end
end
