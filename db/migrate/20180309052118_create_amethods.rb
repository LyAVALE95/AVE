class CreateAmethods < ActiveRecord::Migration[5.1]
  def change
    create_table :amethods do |t|
      t.string :name
      t.string :subject
      t.string :description
      t.string :description_subject
      t.string :skills

      t.timestamps
    end
  end
end
