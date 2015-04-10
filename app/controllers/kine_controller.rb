class KineController < ApplicationController
  before_action :set_cow, only: [:show, :edit, :update, :destroy]

  # GET /kine
  # GET /kine.json
  def index
    @kine = Cow.all
  end

  # GET /kine/1
  # GET /kine/1.json
  def show
  end

  # GET /kine/new
  def new
    @cow = Cow.new
  end

  # GET /kine/1/edit
  def edit
  end

  # POST /kine
  # POST /kine.json
  def create
    @cow = Cow.new(cow_params)

    respond_to do |format|
      if @cow.save
        format.html { redirect_to @cow, notice: 'Cow was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cow }
      else
        format.html { render action: 'new' }
        format.json { render json: @cow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kine/1
  # PATCH/PUT /kine/1.json
  def update
    respond_to do |format|
      if @cow.update(cow_params)
        format.html { redirect_to @cow, notice: 'Cow was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kine/1
  # DELETE /kine/1.json
  def destroy
    @cow.destroy
    respond_to do |format|
      format.html { redirect_to kine_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cow
      @cow = Cow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cow_params
      params.require(:cow).permit(:ear_num, :name, :birth, :sex, :owner_id, :t1, :t2, :t3, :t4, :t5, :t6, :t7, :t8, :t9, :t10, :t11, :t12, :t13, :t14, :t15, :t16, :t17, :t18, :t19, :t20, :t21, :t22, :t23, :t24, :t25, :t26, :t27, :t28, :t29, :t30, :t31, :t32, :t33, :t34, :t35, :t36, :t37, :t38, :t39, :t40, :t41, :t42, :t43, :t44, :t45, :t46, :t47, :t48, :t49, :t50)
    end
end
