class ModelTypesController < ApplicationController
  before_action :set_model_type, only: [:show, :edit, :update, :destroy, :model_types_price]
  skip_before_filter :verify_authenticity_token, only: [:model_types_price]

  # GET /model_types
  # GET /model_types.json
  def index
    models = Model.all.to_json(:include => {:model_types => {:only => [:name], :methods => [:total_price]}}, :only => [:name]) 
    respond_to do |format|
      format.json { render json: {models: JSON.parse(models)} , location: @model_type }
    end
  end

  # GET /model_types/1
  # GET /model_types/1.json
  def show
  end

  # GET /model_types/new
  def new
    @model_type = ModelType.new
    @model = Model.friendly.find(params[:model_id])
  end

  def model_types_price
    model_type = @model_type.as_json(:only => [:name, :base_price], :methods => [:total_price], :base_price => params[:base_price])
    respond_to do |format|
      format.json { render json: {model_type: model_type}, location: nil }
    end
    
  end

  # GET /model_types/1/edit
  def edit
  end

  # POST /model_types
  # POST /model_types.json
  def create
    @model_type = ModelType.new(model_type_params)
    @model = Model.friendly.find(params[:model_id])
    respond_to do |format|
      if @model_type.save
        format.html { render :new }
        format.json { render :show, status: :created, location: @model_type }
      else
        format.html { render :new }
        format.json { render json: @model_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_types/1
  # PATCH/PUT /model_types/1.json
  def update
    respond_to do |format|
      if @model_type.update(model_type_params)
        format.html { redirect_to @model_type, notice: 'Model type was successfully updated.' }
        format.json { render :show, status: :ok, location: @model_type }
      else
        format.html { render :edit }
        format.json { render json: @model_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_types/1
  # DELETE /model_types/1.json
  def destroy
    @model_type.destroy
    respond_to do |format|
      format.html { redirect_to model_types_url, notice: 'Model type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_type
      @model_type = ModelType.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_type_params
      params.require(:model_type).permit(:name, :slug, :model_type_code, :base_price, :model_id)
    end
end
