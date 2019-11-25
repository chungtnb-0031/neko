class FoodsController < ApplicationController
  def index
	@foods = Food.get_category(params[:category]).page(params[:page]).per Settings.per_page_item
  end
end
