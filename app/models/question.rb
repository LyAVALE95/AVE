class Question < ApplicationRecord
	 has_many :question_options, :dependent => :destroy
	 accepts_nested_attributes_for :question_options
end
