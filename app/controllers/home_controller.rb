class HomeController < ApplicationController
	def index
		if current_user.rol == "t"
			@myteacherid = UserTeacher.where("user_id=?",current_user.id).first
			@myuserparters = UserStudent.where("user_teacher_id=?",@myteacherid.id)
			
			@myusers = UserStudent.select("user_students.*,users.id as uid")
			.joins("join users")
			.where("user_students.user_teacher_id=? and user_students.user_id=users.id ",@myteacherid.id)
			@myusersbyuser = User.select("user_students.user_id,user_students.user_teacher_id ,users.*")
			.joins("join user_students")
			.where("user_students.user_teacher_id=? and user_students.user_id=users.id ",@myteacherid.id)
		
		end
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
		#@myteachers = User.where("school_id=?",params[:id]) 
		@myteachers = User.select("users.*,user_teachers.user_id, user_teachers.id as tid")
		.joins("join user_teachers")
		.where("school_id=? and user_teachers.user_id=users.id",params[:id]) 
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
			@myschool = School.select("user_students.school_id,user_students.user_id,schools.*")
			.joins("join user_students")
			.where("user_students.user_id=? and schools.id=user_students.school_id",current_user.id).first
			@mygroups = Group.select("user_students.school_id,user_students.user_id,groups.*")
			.joins("join user_students")
			.where("user_students.user_id=? and groups.id=user_students.group_id",current_user.id)
		else 
			@myuser = UserTeacher.select("users.id,user_teachers.*").joins("join users")
			.where("users.id=? and user_teachers.user_id=?",current_user.id,current_user.id).first
			@myschool = School.select("users.id,schools.*").joins("join users")
			.where("users.id=? and schools.id=users.school_id",current_user.id).first
			@mygroups = Group.select("user_sgs.*,groups.*").joins("join user_sgs")
			.where("user_sgs.user_id=? and groups.id=user_sgs.group_id",current_user.id)
		end
		respond_to do |format|
      	  format.html 
    	  format.json { render json: @mygroups}
    	end
	end	
end
