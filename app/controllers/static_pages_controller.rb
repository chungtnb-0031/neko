class StaticPagesController < ApplicationController
  def home
	@foods = Food.suggest_foods
	@cats = Cat.suggest_cats
  end

  def cat
	@cats = Cat.page(params[:page]).per Settings.per_page_item
	@categories = Cat.distinct.pluck(:category)
  end

  def free_cat
	if (params[:time] == "")
		flash[:danger] = "Empty date"
		redirect_to cat_path
	else
		time= params[:time].tr("T", " ")
		@freeCats = Cat.joins(:time_cats).where("time != '#{time}'").group(:id)
	end
  end

  def food
	@foods = Food.page(params[:page]).per Settings.per_page_item
  end

  def detail_cat
	@cat = Cat.find_by id: params[:id]
  end

  def detail_food
	@food = Food.find_by id: params[:id]
  end

end
