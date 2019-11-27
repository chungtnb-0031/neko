class TimeCatsController < ApplicationController
  before_action :set_time_cat, only: [:show, :edit, :update, :destroy]

  # GET /time_cats
  # GET /time_cats.json
  def index
    @time_cats = TimeCat.all
  end

  # GET /time_cats/1
  # GET /time_cats/1.json
  def show
  end

  # GET /time_cats/new
  def new
    @time_cat = TimeCat.new
  end

  # GET /time_cats/1/edit
  def edit
  end

  # POST /time_cats
  # POST /time_cats.json
  def create
    @time_cat = TimeCat.new(time_cat_params)

    respond_to do |format|
      if @time_cat.save
        format.html { redirect_to @time_cat, notice: 'Time cat was successfully created.' }
        format.json { render :show, status: :created, location: @time_cat }
      else
        format.html { render :new }
        format.json { render json: @time_cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_cats/1
  # PATCH/PUT /time_cats/1.json
  def update
    respond_to do |format|
      if @time_cat.update(time_cat_params)
        format.html { redirect_to @time_cat, notice: 'Time cat was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_cat }
      else
        format.html { render :edit }
        format.json { render json: @time_cat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_cats/1
  # DELETE /time_cats/1.json
  def destroy
    @time_cat.destroy
    respond_to do |format|
      format.html { redirect_to time_cats_url, notice: 'Time cat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_cat
      @time_cat = TimeCat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_cat_params
      params.require(:time_cat).permit(:user_id, :cat_id, :time)
    end
end
