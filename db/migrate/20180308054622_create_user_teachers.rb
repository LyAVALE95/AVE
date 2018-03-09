class CreateUserTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_teachers do |t|
    	t.string :names
    	t.string :lastnames
    	t.string :name
    	t.string :control_number
      t.timestamps
    end
  end
end
