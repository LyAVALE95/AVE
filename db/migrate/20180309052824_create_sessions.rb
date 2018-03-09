class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.string :name
      t.boolean :avaible
      t.bigint :price

      t.timestamps
    end
  end
end
