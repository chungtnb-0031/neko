class FoodRatesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
    
    def create
		@food = Food.find(params[:food_id])
		@foodRate = @food.food_rates.create(rate_params)
		@foodRate.user_id = current_user.id if current_user
		@foodRate.save!
		redirect_to detail_food_path(id: @food.id)
	end
	
    def destroy
        @food = Food.find(params[:food_id])
        @foodRate = @food.food_rates.find(params[:id])
		@foodRate.destroy
		redirect_to detail_food_path(id: @food.id)
    end

	private

    def rate_params
		params.require(:food_rate).permit(:comment, :rate_point)
	end

	def logged_in_user
		return if logged_in?
		store_location
		flash[:danger] = t ".notice"
		redirect_to login_url
	end
end
