class UserQuizzesController < ApplicationController
  before_action :set_user_quiz, only: [:show, :edit, :update, :destroy]
  after_action :update_scores, only: [:create]

  # GET /user_quizzes
  # GET /user_quizzes.json
  def index
    @user_quizzes = UserQuiz.where("user_id = ?",current_user.id)
  end

  # GET /user_quizzes/1
  # GET /user_quizzes/1.json
  def show
  end

  # GET /user_quizzes/new
  def new
    @user_quiz = UserQuiz.new
  end

  # GET /user_quizzes/1/edit
  def edit
  end

  #Ferb     
  def UserQuiz
    #Busca el usuario
    useride = params[:userquizz][:user_id]
    quizide = params[:userquizz][:quiz_id]
    scoreide = params[:userquizz][:score]
    @user = User.find_by(id: params[:userquizz][:user_id])
    @user_student = UserStudent.find_by(user_id: params[:userquizz][:user_id])
    #Busca el user_quiz, si existe
    @userquizz = UserQuiz.where(user_id: useride, quiz_id: quizide)
    
    #Si no encontro, crea un nuevo user_quiz
    if @userquizz == nil || @userquizz == []
      @user_quiz = UserQuiz.new(:user_id => params[:userquizz][:user_id],:quiz_id => params[:userquizz][:quiz_id],:score => params[:userquizz][:score])

      respond_to do |format|
        if @user_quiz.save

          suma = UserQuiz.select("score").where("user_id=?",params[:userquizz][:user_id])
          sum = suma.sum { |p| p.score}

          cantidad = UserQuiz.select("id").where("user_id=?",params[:userquizz][:user_id])
          cantQuizzes = cantidad.count
          @user.score = sum
          @user.update(score: sum)
          @user_student.update(score: sum)
          format.html { redirect_to @user_quiz, notice: 'Creado nuevo user_quiz' }
          format.json { render json: {message: t('Datos guardados (Nuevo score)')} }
        else
          format.html { render :new }
          format.json { render json: @user_quiz.errors, status: :unprocessable_entity }
        end      
      end
    #Si encontro un registro 
    else 
      if @userquizz.first.score != nil
        @userquizz.first.score = 0
        @userquizz.update(score: 0)
      end
      #Si el score actual es mayor a el que tenia antes lo asigna
      if @userquizz.first.score < params[:userquizz][:score].to_f 
        @userquizz.update(score: params[:userquizz][:score])
        #Hace la suma y saca el promedio 
        suma = UserQuiz.select("score").where("user_id=?",params[:userquizz][:user_id])
        sum = suma.sum { |p| p.score}
        cantidad = UserQuiz.select("score").where("user_id=?",params[:userquizz][:user_id])
        cantQuizzes = cantidad.count
        #Lo guarda en el score del usuario
        @user.score = (sum)#Posiblemente se puede borrar, sin afectar...
        @user.update(score: sum)
        @user_student.update(score: sum)
        
        #Muestra el resultado
        respond_to do |format|
          format.html { redirect_to @user_quiz, notice: 'Nuevo Score' }
          format.json { render json: { message: t('Score Actualizado') }}
        end

      end
    
    end
  end

  # POST /user_quizzes
  # POST /user_quizzes.json
  def create
    @user_quiz = UserQuiz.new(user_quiz_params)
    #@newscore = @user_quiz.score.sum(@myuserst.score)
    #@user_quiz_last = UserQuiz.where("user_id = ?",current_user.id).last
    respond_to do |format|
        if @user_quiz.save
          format.html { redirect_to @user_quiz, notice: 'Ha mejorado su calificación' }
          format.json { render :show, status: :created, location: @user_quiz }
        else
          format.html { render :new }
          format.json { render json: @user_quiz.errors, status: :unprocessable_entity }
        end      
    end
  end

  # PATCH/PUT /user_quizzes/1
  # PATCH/PUT /user_quizzes/1.json
  def update
    respond_to do |format|
      if @user_quiz.update(user_quiz_params)
        format.html { redirect_to @user_quiz, notice: 'User quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_quiz }
      else
        format.html { render :edit }
        format.json { render json: @user_quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_quizzes/1
  # DELETE /user_quizzes/1.json
  def destroy
    @user_quiz.destroy
    respond_to do |format|
      format.html { redirect_to user_quizzes_url, notice: 'User quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def update_scores
      @user_quiz = UserQuiz.where("user_id = ?",current_user.id).last
      @myuserst = UserStudent.where("user_id = ?",current_user.id).first
      @mygroup = Group.where("id = ?",@myuserst.group_id).first
      @scoresum = @user_quiz.score.to_f + @myuserst.score.to_f
      @scoresumtot = (@scoresum + @mygroup.average.to_f) 
      current_user.update(score: @scoresum.to_s )
      @myuserst.update(score:@scoresum.to_s)
      @mygroup.update(average:@scoresumtot.to_s)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user_quiz
      @user_quiz = UserQuiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_quiz_params
      params.fetch(:user_quiz,{}).permit(:score,:user_id,:quiz_id)
    end
    def change_params
        params.fetch(:user_quizz,{}).permit(:user_id,:quiz_id,:score)
    end
end
