class ReportsController < ApplicationController
	def bygroup
	@group = Group.where("id=?", params[:id]).first	
	@usersbygroup = UserStudent.where("group_id=?", params[:id])
	  respond_to do |format|
          format.html 
          format.json {  @usersbygroup }
      end
	end
	def index
		@meteacher = UserTeacher.where("user_id=?",current_user.id).first
		@mygroups = Group.select("user_sgs.*,groups.*").joins("join user_sgs")
		.where("user_sgs.user_id = ? and groups.id=user_sgs.group_id",current_user.id)

	end

	def gbygroupall
		respond_to do |format|
		@meteacher = UserTeacher.where("user_id=?",current_user.id).first
		# => @mygroups = Group.where("",current_user.id)
		@mygroupsa = Group.select("user_sgs.group_id,user_sgs.user_id,groups.id,groups.average,groups.updated_at")
		.joins("join user_sgs")
		.where("user_sgs.user_id = ? and groups.id=user_sgs.group_id",current_user.id)
		@mygroups = Group.select("user_sgs.*,groups.*").joins("join user_sgs")
		.where("user_sgs.user_id = ? and groups.id=user_sgs.group_id",current_user.id)
		@mystudentgroups = UserStudent.select("user_students.*")
		.where("user_sgs.user_id = user_students.id and user_sgs.group_id='5'")	
		@allmystudent = UserStudent.where("user_teacher_id = ?", @meteacher.id)		
		format.html 
		format.pdf do
          render pdf: "Mis grupos"
      	end
      	end
		#render json: @mygroupsa.group_by_day(:updated_at).count(:average) 	
	end
end
