class CreateAlgorithms < ActiveRecord::Migration[5.1]
  def change
    create_table :algorithms do |t|
      t.string :name
      t.string :description
      t.integer :level
      t.boolean :avaible
      t.bigint :price
      t.bigint :value

      t.timestamps
    end
  end
end
