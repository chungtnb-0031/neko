class CatRatesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
    
    def create
		@cat = Cat.find(params[:cat_id])
		@catRate = @cat.cat_rates.create(rate_params)
		@catRate.user_id = current_user.id if current_user
		@catRate.save!
		redirect_to detail_cat_path(id: @cat.id)
	end
	
    def destroy
        @cat = Cat.find(params[:cat_id])
        @catRate = @cat.cat_rates.find(params[:id])
		@catRate.destroy
		redirect_to detail_cat_path(id: @cat.id)
    end

	private

    def rate_params
		params.require(:cat_rate).permit(:comment, :rate_point)
	end

	def logged_in_user
		return if logged_in?
		store_location
		flash[:danger] = t ".notice"
		redirect_to login_url
	end
end
