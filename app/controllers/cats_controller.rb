class CatsController < ApplicationController
  def index
	@cats = Cat.get_category(params[:category]).page(params[:page]).per Settings.per_page_item
  end
end
