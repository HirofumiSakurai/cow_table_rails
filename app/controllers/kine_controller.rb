# coding: utf-8
class KineController < ApplicationController
  before_action :set_cow, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: [:update, :destroy]

  # GET /kine
  # GET /kine.json
  def index
    if (params[:redirect] == "on")
      response.headers['X-Accel-Redirect'] = "/reproxy/"
      response.headers['X-reproxy-URL'] = "http://localhost:3001/yesod.json?search=#{params[:search]}&search_owner=#{params[:search_owner]}"
      render nothing: true
    elsif (params[:redirect] == "yesod-sql")
      response.headers['X-Accel-Redirect'] = "/reproxy/"
      response.headers['X-reproxy-URL'] = "http://localhost:3002/sql2str?SQL=SELECT+json_agg(kine)+FROM+kine+WHERE+owner_id+%3D+#{params[:search_owner]}"
      render nothing: true
    elsif (params[:redirect] == "yesod-sql2")
      response.headers['X-Accel-Redirect'] = "/reproxy/"
      response.headers['X-reproxy-URL'] = "http://localhost:3002/sql2str?SQL=WITH+src+AS+%28SELECT+*%2C+daughters%28ear_num%29%2C+ai_logs%28ear_num%29+FROM+kine+WHERE+owner_id+%3D+#{params[:search_owner]}%29+SELECT+json_agg%28src%29+FROM+src%3B"
      render nothing: true
    elsif (params[:redirect] == "sql")
      sql = <<-SQL
        select array_to_json(array_agg(kine))
        from kine
        where owner_id = #{params[:search_owner]}
      SQL
      render json: ActiveRecord::Base.connection.select_value(sql)
    elsif (params[:redirect] == "sql2")
      sql = <<-SQL
        with src AS (SELECT *, daughters(ear_num), ai_logs(ear_num)  
                            FROM kine WHERE owner_id = #{params[:search_owner]})
        select json_agg(src) FROM src;
      SQL
      render json: ActiveRecord::Base.connection.select_value(sql)
    elsif ! (params[:search].nil? && params[:search_owner].nil?)
      @kine = Cow.search(params[:search], params[:search_owner])
      @kineHash = @kine.pluck2hash(:id, :name, :ear_num, :birth, :owner_id, :t1, :t2, :t3, :t4, :t5, :t6, :t7, :t8, :t9, :t10) #, :t11, :t12, :t13, :t14, :t15, :t16, :t17, :t18, :t19, :t20, :t21, :t22, :t23, :t24, :t25, :t26, :t27, :t28, :t29, :t30, :t31, :t32, :t33, :t34, :t35, :t36, :t37, :t38, :t39, :t40, :t41, :t42, :t43, :t44, :t45, :t46, :t47, :t48, :t49, :t50, :t51, :t52, :t53, :t54, :t55, :t56, :t57, :t58, :t59, :t60, :t61, :t62, :t63, :t64, :t65, :t66, :t67, :t68, :t69, :t70, :t71, :t72, :t73, :t74, :t75, :t76, :t77, :t78, :t79, :t80, :t81, :t82, :t83, :t84, :t85, :t86, :t87, :t88, :t89, :t90, :t91, :t92, :t93, :t94, :t95, :t96, :t97, :t98, :t99)
#    @kineArray = @kine.pluck2array(:id, :name, :ear_num, :birth, :owner_id )
      #, :t01, :t02, :t03, :t04, :t05, :t06, :t07, :t08, :t09, :t10, :t11, :t12, :t13, :t14, :t15, :t16, :t17, :t18, :t19, :t20, :t21, :t22, :t23, :t24, :t25, :t26, :t27, :t28, :t29, :t30, :t31, :t32, :t33, :t34, :t35, :t36, :t37, :t38, :t39, :t40, :t41, :t42, :t43, :t44, :t45, :t46, :t47, :t48, :t49, :t50, :t51, :t52, :t53, :t54, :t55, :t56, :t57, :t58, :t59, :t60, :t61, :t62, :t63, :t64, :t65, :t66, :t67, :t68, :t69, :t70, :t71, :t72, :t73, :t74, :t75, :t76, :t77, :t78, :t79, :t80, :t81, :t82, :t83, :t84, :t85, :t86, :t87, :t88, :t89, :t90, :t91, :t92, :t93, :t94, :t95, :t96, :t97, :t98, :t99)
    else
      @kine = []
    end
  end

  # GET /kine/1
  # GET /kine/1.json
  def show
    if (params[:redirect] == "sql2")
      sql = <<-SQL
        with src AS (SELECT *, daughters(ear_num), ai_logs(ear_num)  
                     FROM kine WHERE id = #{params[:id]})
        select json_agg(src) FROM src;
      SQL
      render json: ActiveRecord::Base.connection.select_value(sql)
    end      
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


