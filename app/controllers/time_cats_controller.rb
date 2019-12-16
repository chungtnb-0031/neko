class TimeCatsController < ApplicationController
  before_action :set_time_cat, only: [:show, :edit, :update, :destroy]

  def index
    @time_cats = TimeCat.all
  end

  def show
  end

  def new
	@cat_item = Cart.find(session[:cart_id]).cat_items.first
	@line_item = Cart.find(session[:cart_id]).line_items.first
	
	if @cat_item.nil? || @line_item.nil?
		flash[:danger] = "You have not chosen cat or food"
		redirect_to root_path
	else
		cat_id = @cat_item.cat_id
		@cat = Cat.find(cat_id)
		@time_cat = TimeCat.new
	end
  end

  def edit
  end

  def create
	@cart = Cart.find(session[:cart_id])
	@time_cat = TimeCat.new(time_cat_params)
	respond_to do |format|
		if @time_cat.save
			format.html { redirect_to root_path, notice: 'Complete' }
			@cart.destroy
			session[:cart_id] = nil
		else
			format.html { render :new }
			format.json { render json: @time_cat.errors, status: :unprocessable_entity }
		end
	end
  end

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

  def destroy
    @time_cat.destroy
    respond_to do |format|
      format.html { redirect_to time_cats_url, notice: 'Time cat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_time_cat
      @time_cat = TimeCat.find(params[:id])
    end

    def time_cat_params
      params.require(:time_cat).permit(:user_id, :cat_id, :time)
    end
end
