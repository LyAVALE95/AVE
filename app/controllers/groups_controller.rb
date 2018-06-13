class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end 

  #Ferb:
  def buscarPromedio
    user = User.find_by(id: params[:id])
    #inicializar variables
    sumaTotal = 0

    #Busca el maestro con el id de user'
    user_teacher = UserTeacher.find_by(user_id: params[:id])
    #Busca cada estudiante que tenga el maestro encontrado
    usuarios = User.select("users.score").from("user_students,users").where(" user_students.user_teacher_id = ? and user_students.user_id = users.id ",user_teacher.id)

    #Buscar quiz?id de cada estudiante
      #Obtener estudiantes
    user_studentss = UserStudent.select("*").from("user_students").where("user_students.user_teacher_id=?",user_teacher.id)
      #saca el promedio de cada estudiante y lo suma a sumaTotal
    user_studentss.each do |u|

      user_quizes = UserQuiz.select("user_quizzes.score").where("user_id=?",u.user_id)

      sum = user_quizes.sum { |p| p.score}
      sumaTotal = sumaTotal + (sum.to_f/user_quizes.count.to_f)
    end 
    promedio = sumaTotal.to_f/user_studentss.count.to_f
    #Suma los resultados anteriores
    group = Group.find_by(id: user_studentss.first.group_id)
    respond_to do |format|
      format.json { render json: {average: promedio, cantalumnos: user_studentss.count, description: group.description} }
    end
    #saca el promedio
    #promedio = sum.to_f/usuarios.count
    #@group = Group.where("id = ?",user.group_id)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
   # @mygroups = Group.select("user_sgs.*,groups.*").joins("join user_sgs")
   #.where("user_sgs.user_id = ? and groups.id=user_sgs.group_id",current_user.id)
    @mygroups = Group.where("id=?", params[:id])
    @usersbygroup = UserStudent.where("group_id=?", params[:id])
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        @group_SU = UserSg.new(user_id: current_user.id, school_id: current_user.school_id,group_id: @group.id)
        @group_SU.save!
        format.html { redirect_to "/myuser", notice: 'El grupo ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to "/myuser", notice: 'El grupo ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'El grupo ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
        params.require(:group).permit(:name,:description,:schedule,:rooms,:semester,:career,:average)
        #params.fetch(:group, {})
    end
end
