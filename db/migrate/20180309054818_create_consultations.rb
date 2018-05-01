class CreateConsultations < ActiveRecord::Migration[5.1]
  def change
    create_table :consultations do |t|
      t.text :links
      t.text :books
      t.text :references

      t.timestamps
    end
  end
end
