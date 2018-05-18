class ReportsController < ApplicationController
	def bygroup
	@group = Group.where("id=?", params[:id]).first	
	@usersbygroup = UserStudent.where("group_id=?", params[:id])
	respond_to do |format|
        format.html 
        format.json {  @usersbygroup }
	end
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
		format.html 
		format.pdf do
          render pdf: "Reportsdkfnjd",
     	  template: "reports/gbygroupall.pdf.erb"
      	end
      	end
		#render json: @mygroupsa.group_by_day(:updated_at).count(:average) 	
	end
end
