class CatItemsController < ApplicationController
	before_action :logged_in_user
	include CurrentCart
	before_action :set_cat_item, only: [:show, :edit, :update, :destroy]
	before_action :set_cart, only: [:create]

  def index
    @cat_items = CatItem.all
  end

  def show
  end

  def new
    @cat_item = CatItem.new
  end

  def edit
  end

  def create
	@cat_items = CatItem.all
	cat = Cat.find(params[:cat_id])
	if @cat_items.blank?
		@cat_item = @cart.add_cat(cat)

		respond_to do |format|
			if @cat_item.save
			  format.html { redirect_to @cat_item.cart, notice: 'Cat item was successfully created.' }
			  format.json { render :show, status: :created, location: @cat_item }
			else
			  format.html { render :new }
			  format.json { render json: @cat_item.errors, status: :unprocessable_entity }
			end
		end
	else
		respond_to do |format|
			flash[:danger] = "Only one cat can be ordered"
			format.html{redirect_to root_path}
		end
	end   
  end

  def update
    respond_to do |format|
      if @cat_item.update(cat_item_params)
        format.html { redirect_to @cat_item, notice: 'Cat item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cat_item }
      else
        format.html { render :edit }
        format.json { render json: @cat_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	@cart = Cart.find(session[:cart_id])
    @cat_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: 'Cat item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat_item
      @cat_item = CatItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cat_item_params
      params.require(:cat_item).permit(:cat_id)
	end
	
	def logged_in_user
		return if logged_in?
		store_location
		flash[:danger] = "You are not logged in"
		redirect_to login_url
	end
end
