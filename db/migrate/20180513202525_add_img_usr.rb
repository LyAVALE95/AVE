class AddImgUsr < ActiveRecord::Migration[5.1]
  def change
  	add_column :user_teachers, :avatar, :integer, default:0
  	add_column :user_students, :avatar, :integer, default:0
  end
end
