class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  $quizid
  def index
    #@quizzes = Quiz.all
    if current_user.rol == 't'
    @quizzes = Quiz.where("user_id = ?",current_user.id)
    else
       @quizzes = Quiz.select('quizzes.*, user_teachers.id as tid,user_teachers.user_id,user_students.user_teacher_id')
      .joins('join user_students').where('user_students.user_id = ?',current_user.id)
      .joins('join user_teachers').where('user_teachers.id=user_students.user_teacher_id and user_teachers.user_id=quizzes.user_id')
    end
  end

  def listexam
    #@quizzes = Quiz.all
    if params[:rol] == 't'
    @quizzes = Quiz.where("user_id = ?",params[:id])
    else
       @quizzes = Quiz.select('quizzes.*, user_teachers.id as tid,user_teachers.user_id,user_students.user_teacher_id')
      .joins('join user_students').where('user_students.user_id = ?',params[:id])
      .joins('join user_teachers').where('user_teachers.id=user_students.user_teacher_id and user_teachers.user_id=quizzes.user_id')
    end
    respond_to do |format|
      format.html 
      format.json { render json: @quizzes }
    end
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    $quizid = Question.last.id
    @question = Question.new(quiz_id: params[:id])
    #@question_option = QuestionOption.new(quiz_id: params[:id])
    @questions = Quiz.select('quizzes.*, questions.*').joins("join questions")
     .where("quizzes.id = ? and questions.quiz_id = ?",params[:id],params[:id])
    @question_options = Question.select('questions.*, question_options.*').joins("join question_options")
     .where("questions.quiz_id = ? and question_options.question_id = questions.id",params[:id])
      #@details = Session.select("sessions.*,session_details.*").
      #joins("join Session_detail").where("session_details.session_id=?",params[:id])
   respond_to do |format|
      format.html 
      format.json { render json: @questions }
    end
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'El cuestionario ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'El cuestionario ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'El cuestionario ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:description, :approved, :avaible,:session_id,:user_id,:user_teacher_id)
    end
end
