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
      @sessions = Session.where("user_id = ?",current_user.id)
    else
      @sessions = Session.select('sessions.*, user_teachers.id as tid,user_teachers.user_id,user_students.user_teacher_id')
      .joins('join user_students').where('user_students.user_id = ?',current_user.id)
      .joins('join user_teachers').where('user_teachers.id=user_students.user_teacher_id and user_teachers.user_id=sessions.user_id')
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
     #@details = Session.select('sessions.*, session_details.*').joins("join session_details")
     #.where("session_details.session_id = 1 ",params[:id])
     @session_detail = SessionDetail.new(session_id: params[:id])#(session_detail: SessionDetail)
     @session_quiz = Quiz.new(session_id: params[:id])
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
        format.html { redirect_to @session, notice: 'Session was successfully created.' }
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
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
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
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
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
