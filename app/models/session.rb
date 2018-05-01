class Session < ApplicationRecord
	 has_many :session_details, :dependent => :destroy
	 accepts_nested_attributes_for :session_details
end
