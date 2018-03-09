class CreateSessionDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :session_details do |t|
      t.text :txt1
      t.text :txt2
      t.text :txt3

      t.timestamps
    end
  end
end
