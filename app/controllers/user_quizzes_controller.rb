class UserQuizzesController < ApplicationController
  before_action :set_user_quiz, only: [:show, :edit, :update, :destroy]

  # GET /user_quizzes
  # GET /user_quizzes.json
  def index
    @user_quizzes = UserQuiz.all
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

  # POST /user_quizzes
  # POST /user_quizzes.json
  def create
    @user_quiz = UserQuiz.new(user_quiz_params)

    respond_to do |format|
      if @user_quiz.save
        format.html { redirect_to @user_quiz, notice: 'User quiz was successfully created.' }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_user_quiz
      @user_quiz = UserQuiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_quiz_params
      params.require(:user_quiz).permit(:score)
    end
end
