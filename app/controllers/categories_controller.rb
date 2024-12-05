class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
	  @category = Category.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
	@post = @category.posts.build
  end

  def edit
  end

  def create
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
