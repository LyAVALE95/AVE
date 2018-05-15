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
	

	def getmygroups
		@mygroupsby = UserSg.select("user_sgs.school_id,user_sgs.user_id,groups.*").joins("join groups")
		.where("user_sgs.school_id=? and user_sgs.group_id = groups.id ",params[:id])
		respond_to do |format|
      	  format.html 
    	  format.json { render json: @mygroupsby}
    	end
	end	 
	def getmyteachers
		@myteachers = User.where("school_id=?",params[:id]) 
		respond_to do |format|
      	  format.html 
    	  format.json { render json: @myteachers}
    	end
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
		@myschool = School.select("users.id,schools.*").joins("join users")
			.where("users.id=? and schools.id=users.school_id",current_user.id).first
		@mygroups = Group.select("user_sgs.*,groups.*").joins("join user_sgs")
			.where("user_sgs.user_id=? and groups.id=user_sgs.group_id",current_user.id)		
		respond_to do |format|
      	  format.html 
    	  format.json { render json: @mygroups}
    	end
	end	
end
