class AddImgUsrName < ActiveRecord::Migration[5.1]
  def change
  	add_column :user_teachers, :avatarn, :string, default:"052-man-24"
  	add_column :user_students, :avatarn, :string, default:"boy"
  end
end
