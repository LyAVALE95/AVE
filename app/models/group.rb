class Group < ApplicationRecord
	has_many :user_students, :dependent => :destroy
	has_many :user_teachers, :dependent => :destroy
end
