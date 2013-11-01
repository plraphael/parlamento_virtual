class Admin::LawsController < Admin::ApplicationController
  before_action :set_admin_law, only: [:show, :edit, :update, :destroy]

  # GET /admin/laws
  # GET /admin/laws.json
  def index
    @admin_laws = Law.all
  end

  # GET /admin/laws/1
  # GET /admin/laws/1.json
  def show
  end

  # GET /admin/laws/new
  def new
    @admin_law = Law.new
  end

  # GET /admin/laws/1/edit
  def edit
  end

  # POST /admin/laws
  # POST /admin/laws.json
  def create
    @admin_law = Law.new(admin_law_params)

    respond_to do |format|
      if @admin_law.save
        format.html { redirect_to admin_law_url(@admin_law), notice: 'Law was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_law }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_law.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/laws/1
  # PATCH/PUT /admin/laws/1.json
  def update
    respond_to do |format|
      if @admin_law.update(admin_law_params)
        format.html { redirect_to admin_law_path(@admin_law), notice: 'Law was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_law.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/laws/1
  # DELETE /admin/laws/1.json
  def destroy
    @admin_law.destroy
    respond_to do |format|
      format.html { redirect_to admin_laws_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_law
      @admin_law = Law.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_law_params
      params.require(:law).permit(:title, :type, :excerpt, :description, :state, :real_law_id)
    end
end
