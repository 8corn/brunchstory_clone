class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
	  @posts = @category.posts.order(created_at: :desc)
  end

  def new
  end

  def edit
  end

  def create
	    @category = Category.new(category_params)
  if @category.save
    redirect_to categories_path
  else
    render :new, status: :unprocessable_entity
  end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
