class SessionDetailsController < ApplicationController
  before_action :set_session_detail, only: [:show, :edit, :update, :destroy]

  # GET /session_details
  # GET /session_details.json
  def index
    @session_details = SessionDetail.all
  end

  # GET /session_details/1
  # GET /session_details/1.json
  def show
  end

  # GET /session_details/new
  def new
    @session_detail = SessionDetail.new
  end

  # GET /session_details/1/edit
  def edit
  end

  # POST /session_details
  # POST /session_details.json
  def create
    @session_detail = SessionDetail.new(session_detail_params)

    respond_to do |format|
      if @session_detail.save
        format.html { redirect_to @session_detail, notice: 'Session detail was successfully created.' }
        format.json { render :show, status: :created, location: @session_detail }
      else
        format.html { render :new }
        format.json { render json: @session_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_details/1
  # PATCH/PUT /session_details/1.json
  def update
    respond_to do |format|
      if @session_detail.update(session_detail_params)
        format.html { redirect_to @session_detail, notice: 'Session detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @session_detail }
      else
        format.html { render :edit }
        format.json { render json: @session_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_details/1
  # DELETE /session_details/1.json
  def destroy
    @session_detail.destroy
    respond_to do |format|
      format.html { redirect_to session_details_url, notice: 'Session detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_detail
      @session_detail = SessionDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_detail_params
      params.require(:session_detail).permit(:txt1, :txt2, :txt3)
    end
end
