class UserSGsController < ApplicationController
  before_action :set_user_sg, only: [:show, :edit, :update, :destroy]

  # GET /user_sgs
  # GET /user_sgs.json
  def index
    @user_sgs = UserSg.all
  end

  # GET /user_sgs/1
  # GET /user_sgs/1.json
  def show
  end

  # GET /user_sgs/new
  def new
    @user_sg = UserSg.new
  end

  # GET /user_sgs/1/edit
  def edit
  end

  # POST /user_sgs
  # POST /user_sgs.json
  def create
    @user_sg = UserSg.new(user_sg_params) 
    respond_to do |format|
      if @user_sg.save
        format.html { redirect_to @user_sg, notice: 'User sg was successfully created.' }
        format.json { render :show, status: :created, location: @user_sg }
      else
        format.html { render :new }
        format.json { render json: @user_sg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_sgs/1
  # PATCH/PUT /user_sgs/1.json
  def update
    respond_to do |format|
      if @user_sg.update(user_sg_params)
        format.html { redirect_to @user_sg, notice: 'User sg was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_sg }
      else
        format.html { render :edit }
        format.json { render json: @user_sg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sgs/1
  # DELETE /user_sgs/1.json
  def destroy
    @user_sg.destroy
    respond_to do |format|
      format.html { redirect_to user_sgs_url, notice: 'User sg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_sg
      @user_sg = UserSg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_sg_params
      params.require(:user_sg).permit(:user_id, :school_id, :group_id)
    end
end
