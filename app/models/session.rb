class Session < ApplicationRecord
	 has_many :session_details, :dependent => :destroy
end
