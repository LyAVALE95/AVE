class UserStudentsController < ApplicationController
  before_action :set_user_student, only: [:show, :edit, :update, :destroy]
  $school
  $group
  $user_id
  # GET /user_students
  # GET /user_students.json
  def index
    @user_students = UserStudent.all
  end

  # GET /user_students/1
  # GET /user_students/1.json
  def show
  end

  def updatemyusr
     @user_student = UserStudent.where("user_students.user_id = ?",params[:id])
    respond_to do |format|
      if @user_student.update(user_student_params)
        format.html { redirect_to "/myuser", notice: 'Usuario actualizado correctamente' }
        format.json { render :show, status: :ok, location: '/myuser'}
      else
        format.html { render :edit }
      end
      end
  end

  # GET /user_students/new
  def new
    @user_student = UserStudent.new
  end

  # GET /user_students/1/edit
  def edit
  end

  # POST /user_students
  # POST /user_students.json
  def create
    @user_student = UserStudent.new(user_student_params)

    respond_to do |format|
      if @user_student.save
        format.html { redirect_to @user_student, notice: 'User student was successfully created.' }
        format.json { render :show, status: :created, location: @user_student }
      else
        format.html { render :new }
        format.json { render json: @user_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_students/1
  # PATCH/PUT /user_students/1.json
  def update
    respond_to do |format|
      if @user_student.update(user_student_params)
        format.html { redirect_to "/myuser", notice: 'User student was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_student }
      else
        format.html { render :edit }
        format.json { render json: @user_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_students/1
  # DELETE /user_students/1.json
  def destroy
    @user_student.destroy
    respond_to do |format|
      format.html { redirect_to user_students_url, notice: 'User student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_student
      @user_student = UserStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_student_params
      #params.fetch(:user_student, {})
      params.require(:user_student).permit(:names,:lastnames,:name,:control_number,:carrer,:grade,:algorithm_level,:course_level,:score,:user_id,:school_id,:avatarn,:group_id,:user_teacher_id)
    end
end 
