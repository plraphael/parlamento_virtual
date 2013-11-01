class Admin::RealLawsController < Admin::ApplicationController
  before_action :set_admin_real_law, only: [:show, :edit, :update, :destroy]

  # GET /admin/real_laws
  # GET /admin/real_laws.json
  def index
    @admin_real_laws = RealLaw.all
  end

  # GET /admin/real_laws/1
  # GET /admin/real_laws/1.json
  def show
    @admin_law = Law.find_or_initialize_by(real_law: @admin_real_law)
  end

  # GET /admin/real_laws/new
  def new
    @admin_real_law = RealLaw.new
  end

  # GET /admin/real_laws/1/edit
  def edit
  end

  # POST /admin/real_laws
  # POST /admin/real_laws.json
  def create
    @admin_real_law = RealLaw.new(admin_real_law_params)

    respond_to do |format|
      if @admin_real_law.save
        format.html { redirect_to admin_real_law_url(@admin_real_law), notice: 'Real law was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_real_law }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_real_law.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/real_laws/1
  # PATCH/PUT /admin/real_laws/1.json
  def update
    respond_to do |format|
      if @admin_real_law.update(admin_real_law_params)
        format.html { redirect_to admin_real_law_url(@admin_real_law), notice: 'Real law was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_real_law.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/real_laws/1
  # DELETE /admin/real_laws/1.json
  def destroy
    @admin_real_law.destroy
    respond_to do |format|
      format.html { redirect_to admin_real_laws_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_real_law
      @admin_real_law = RealLaw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_real_law_params
      params.require(:real_law).permit(:real_id, :name, :type, :number, :year, :proposition_date, :excerpt, :description, :regime, :appraisal, :state)
    end
end
