class UserTeachersController < ApplicationController
  before_action :set_user_teacher, only: [:show, :edit, :update, :destroy]

  # GET /user_teachers
  # GET /user_teachers.json
  def index
    @user_teachers = UserTeacher.all
  end

  # GET /user_teachers/1
  # GET /user_teachers/1.json
  def show
  end

  # GET /user_teachers/new
  def new
    @user_teacher = UserTeacher.new
  end

  # GET /user_teachers/1/edit
  def edit
  end

  # POST /user_teachers
  # POST /user_teachers.json
  def create
    @user_teacher = UserTeacher.new(user_teacher_params)

    respond_to do |format|
      if @user_teacher.save
        format.html { redirect_to @user_teacher, notice: 'User teacher was successfully created.' }
        format.json { render :show, status: :created, location: @user_teacher }
      else
        format.html { render :new }
        format.json { render json: @user_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_teachers/1
  # PATCH/PUT /user_teachers/1.json
  def update
    respond_to do |format|
      if @user_teacher.update(user_teacher_params)
        current_user.update_attributes(name: @user_teacher.name)
        format.html { redirect_to @user_teacher, notice: 'User teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_teacher }
      else
        format.html { render :edit }
        format.json { render json: @user_teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_teachers/1
  # DELETE /user_teachers/1.json
  def destroy
    @user_teacher.destroy
    respond_to do |format|
      format.html { redirect_to user_teachers_url, notice: 'User teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_teacher
      @user_teacher = UserTeacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_teacher_params 
      params.fetch(:user_teacher,{}).permit(:names,:lastnames,:name,:control_number,:user_id,:avatarn)
    end
end
