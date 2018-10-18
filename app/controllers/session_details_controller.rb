class SessionDetailsController < ApplicationController
  before_action :set_session_detail, only: [ :edit, :update, :destroy]

  # GET /session_details
  # GET /session_details.json
  def index
    @session_details = SessionDetail.all
  end
  def all
     @session_details = SessionDetail.select("session_details.*")
     .joins("join sessions")
     .where("sessions.user_id = 19 and session_details.session_id = sessions.id")
     respond_to do |format|
        format.json { render json: {sessions: @session_details} }
    end
    
  end
  def allsessions
     @session_details = SessionDetail.select("session_details.*")
     .joins("join sessions")
     .where("session_details.session_id = ?", params[:id])
     respond_to do |format|
        format.json { render json: {sessions: @session_details} }
    end
    
  end

  # GET /session_details/1
  # GET /session_details/1.json
  def show
      #@session_detailpag = SessionDetail.find(params[:id])
      @session_detail = SessionDetail.find_by(session_id: params[:id])
      respond_to do |format|
        format.html { 
          @session_detail = SessionDetail.find(params[:id]) }
        format.json { render json: @session_detail }
      end
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
        #format.html { redirect_to @session_detail, notice: 'Session detail was successfully created.' }
        #format.json { render :show, status: :created, location: @session_detail }
        format.html { redirect_to sessions_url, notice: 'La lección ha sido creada exitosamente.' }
        format.json { head :no_content, status: :created, location: @session_detail }
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
        format.html { redirect_to @session_detail, notice: 'La lección ha sido actualizada exitosamente.' }
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
      format.html { redirect_to session_details_url, notice: 'La lección ha sido eliminada exitosamente.' }
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
      params.require(:session_detail).permit(:txt1, :txt2, :txt3,:session_id)
    end
end
