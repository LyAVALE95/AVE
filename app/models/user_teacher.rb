class UserTeacher < ApplicationRecord
	has_one :school
	has_one :group
end
