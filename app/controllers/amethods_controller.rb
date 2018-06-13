class AmethodsController < ApplicationController
  before_action :set_amethod, only: [:show, :edit, :update, :destroy]

  # GET /amethods
  # GET /amethods.json
  $cmethods = 0
  def index
    @amethods = Amethod.all
    respond_to do |format|
        format.html 
        format.json { render json: {sessions: @amethods} }
    end
    @session_details = SessionDetail.all
    @session_detail = SessionDetail.new()
  end

  def count 
    $cmethods = 1
    #redirect_to amethod_url(@amethod)
  end

  # GET /amethods/1
  # GET /amethods/1.json
  def show
    #$cmethods = 0
  end
  def news 

  end

  # GET /amethods/new
  def new
    @amethod = Amethod.new
  end

  # GET /amethods/1/edit
  def edit
  end

  # POST /amethods
  # POST /amethods.json
  def create
    @amethod = Amethod.new(amethod_params)

    respond_to do |format|
      if @amethod.save
        format.html { redirect_to @amethod, notice: 'Amethod was successfully created.' }
        format.json { render :show, status: :created, location: @amethod }
        format.js
      else
        format.html { render :new }
        format.json { render json: @amethod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /amethods/1
  # PATCH/PUT /amethods/1.json
  def update
    respond_to do |format|
      if @amethod.update(amethod_params)
        format.html { redirect_to @amethod, notice: 'Amethod was successfully updated.' }
        format.json { render :show, status: :ok, location: @amethod }
      else
        format.html { render :edit }
        format.json { render json: @amethod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /amethods/1
  # DELETE /amethods/1.json
  def destroy
    @amethod.destroy
    respond_to do |format|
      format.html { redirect_to amethods_url, notice: 'Amethod was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amethod
      @amethod = Amethod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def amethod_params
      params.require(:amethod).permit(:name, :subject, :description, :description_subject, :skills)
    end
end
