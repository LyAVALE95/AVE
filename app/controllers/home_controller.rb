class HomeController < ApplicationController
	def index
	end	
	def welcome
	end	
	def promo
	end	
	def home
	end	
	def alg
	end	
	def myuser
		@myuser = current_user 
		if @myuser.rol == "s"
			@myuser = UserStudent.select("users.id,user_students.*").joins("join users")
			.where("users.id=? and user_students.user_id=?",current_user.id,current_user.id).first
		else 
			@myuser = UserTeacher.select("users.id,user_teachers.*").joins("join users")
			.where("users.id=? and user_teachers.user_id=?",current_user.id,current_user.id).first
		end
		respond_to do |format|
      	  format.html 
    	  format.json { render json: @myuser }
    	end
	end	
end
