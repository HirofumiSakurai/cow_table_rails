class AiLogsController < ApplicationController
  before_action :set_ai_log, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: [:update, :destroy]

  # GET /ai_logs
  # GET /ai_logs.json
  def index
    @ai_logs = AiLog.all
  end

  # GET /ai_logs/1
  # GET /ai_logs/1.json
  def show
  end

  # GET /ai_logs/new
  def new
    @ai_log = AiLog.new
  end

  # GET /ai_logs/1/edit
  def edit
  end

  # POST /ai_logs
  # POST /ai_logs.json
  def create
    @ai_log = AiLog.new(ai_log_params)

    respond_to do |format|
      if @ai_log.save
        format.html { redirect_to @ai_log, notice: 'Ai log was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ai_log }
      else
        format.html { render action: 'new' }
        format.json { render json: @ai_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ai_logs/1
  # PATCH/PUT /ai_logs/1.json
  def update
    respond_to do |format|
      if @ai_log.update(ai_log_params)
        format.html { redirect_to @ai_log, notice: 'Ai log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ai_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ai_logs/1
  # DELETE /ai_logs/1.json
  def destroy
    @ai_log.destroy
    respond_to do |format|
      format.html { redirect_to ai_logs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ai_log
      @ai_log = AiLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ai_log_params
      params.require(:ai_log).permit(:cow_no, :date, :state)
    end
end
