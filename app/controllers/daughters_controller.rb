class DaughtersController < ApplicationController
  before_action :set_daughter, only: [:show, :edit, :update, :destroy]

  # GET /daughters
  # GET /daughters.json
  def index
    @daughters = Daughter.all
  end

  # GET /daughters/1
  # GET /daughters/1.json
  def show
    if (params[:redirect] == "on")
      sql = <<-SQL
        with src AS (SELECT daughters(ear_num)
                     FROM kine WHERE id = #{params[:id]})
        select json_agg(src) FROM src;
      SQL
      render json: ActiveRecord::Base.connection.select_value(sql)
    end
  end

  # GET /daughters/new
  def new
    @daughter = Daughter.new
  end

  # GET /daughters/1/edit
  def edit
  end

  # POST /daughters
  # POST /daughters.json
  def create
    @daughter = Daughter.new(daughter_params)

    respond_to do |format|
      if @daughter.save
        format.html { redirect_to @daughter, notice: 'Daughter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @daughter }
      else
        format.html { render action: 'new' }
        format.json { render json: @daughter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daughters/1
  # PATCH/PUT /daughters/1.json
  def update
    respond_to do |format|
      if @daughter.update(daughter_params)
        format.html { redirect_to @daughter, notice: 'Daughter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @daughter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daughters/1
  # DELETE /daughters/1.json
  def destroy
    @daughter.destroy
    respond_to do |format|
      format.html { redirect_to daughters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daughter
      # @daughter = Daughter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daughter_params
      params.require(:daughter).permit(:owner_id)
    end
end
