class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
    	t.string :name
    	t.string :description
    	t.string :schedule
    	t.string :rooms
    	t.string :semester
    	t.string :career
    	t.float :average
      t.timestamps
    end
  end
end
