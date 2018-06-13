class SessionsController < ApplicationController
#class SessionsController < Devise::SessionsController
  before_action :set_session, only: [:show, :edit, :update, :destroy] do
    redirect_to new_user_session_path unless current_user
  end

  # GET /sessions
  # GET /sessions.json
  def index
    #@sessions = Session.all
    if current_user.rol == 't'
      @sessions = Session.where("user_id = ?",current_user.id).order("price")
    else
      @sessions = Session.select('sessions.*, user_teachers.id as tid,user_teachers.user_id,user_students.user_teacher_id')
      .joins('join user_students').where('user_students.user_id = ?',current_user.id)
      .joins('join user_teachers').where('user_teachers.id=user_students.user_teacher_id and user_teachers.user_id=sessions.user_id').order("price")
    end
  end

  #Ferb:
  def sessionsUser
    @is_teacher = UserTeacher.select("user_teachers.*").where("user_teachers.user_id = ?",params[:id])
    #si no es maestro
    if @is_teacher == nil || @is_teacher == []
      #Busca al maestro de este alumno
      @user_teachers = UserTeacher.select("user_teachers.*").from("user_teachers,user_students").where("user_teachers.id = user_students.user_teacher_id and user_students.user_id =?",params[:id])
      #trae todas las lecciones
      @sesiones = Session.select('sessions.*, user_teachers.id as tid,user_teachers.user_id,user_students.user_teacher_id')
        .joins('join user_students').where('user_students.user_id = ?',params[:id])
        .joins('join user_teachers').where('user_teachers.id=user_students.user_teacher_id and user_teachers.user_id=sessions.user_id')

      #Ahora trae solo los que estan disponibles para este usuario
      @sessions = Session.select("sessions.*").from("user_quizzes, sessions, quizzes, users").where("sessions.id = quizzes.session_id and (user_quizzes.quiz_id = quizzes.id and user_quizzes.user_id = users.id and users.id = ?) and user_quizzes.score >= sessions.price and sessions.user_id=?",params[:id],@user_teachers.first.user_id)
      #Compara que el id de las lecciones disponibles sean igual a la consulta de todas las lecciones, si son iguales, les asigna 1 (Disponible)
      cant = ""
      @sesiones.each do |o|
        o.avaible = 0
      end
      @sesiones.each do |o|
        cant = cant + "- o.id " + o.id.to_s + "avaible:" + o.avaible.to_s
        @sessions.each do |u|
          cant = cant + " u.id " + u.id.to_s + "AntAvaible:" + o.avaible.to_s
          if u.id == o.id
            o.avaible = 1
          end
          cant = cant + "DespAvaible:" + o.avaible.to_s
        end 
      end
      respond_to do |format|
        format.html 
        format.json { render json: @sesiones }
      end
    else
      @sessions = Session.select("sessions.*").where("sessions.user_id = ?",params[:id])
      @sessions.each do |u|
        u.avaible = 1
      end 
      respond_to do |format|
        format.html 
        format.json { render json: @sessions }
      end
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
     #@details = Session.select('sessions.*, session_details.*').joins("join session_details")
     #.where("session_details.session_id = 1 ",params[:id])
     @session_detail = SessionDetail.new(session_id: params[:id])#(session_detail: SessionDetail)
     @session_quiz = Quiz.new(session_id: params[:id])
     @consultations = Consultation.new(session_id: params[:id])
     @consultations_all_links = Consultation.where("session_id = ? and links!=''", params[:id])
     @consultations_all_books = Consultation.where("session_id = ? and books!=''", params[:id])
     #@session_detail.save!
     #@session_detail = SessionDetail.session_detail.build
      @quizzes = Quiz.where('session_id = ?',params[:id] ) 
       @details = Session.select('sessions.*, session_details.*').joins("join session_details")
     .where("sessions.id = ? and session_details.session_id = ?",params[:id],params[:id])
      #@details = Session.select("sessions.*,session_details.*").
      #joins("join Session_detail").where("session_details.session_id=?",params[:id])
   respond_to do |format|
      format.html 
      format.json { render json: @details }
    end

  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to @session, notice: 'La lección ha sido creada exitosamente.' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'La lección ha sido actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'La lección ha sido eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:name, :price,:user_id ,session_detail_attributes: [:txt1, :txt2, :txt3, :session_id])
    end
end
