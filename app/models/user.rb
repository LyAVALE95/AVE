class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :create_and_associate_user, :only => :create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_and_associate_user
    if self.rol == "s"
      user_s = UserStudent.new(names: self.names, lastnames: self.lastnames,name: self.name, control_number: self.control_number, user_id: self.id)
      user_s.save!
    else
      user_s = UserTeacher.new(names: self.names, lastnames: self.lastnames,name: self.name, control_number: self.control_number,user_id: self.id)
      user_s.save!
    end
  end
end
