class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.text :location
      t.string :principal_name
      t.string :type
      t.string :grade
      t.string :code
      t.string :phone
      t.string :web_page

      t.timestamps
    end
  end
end
