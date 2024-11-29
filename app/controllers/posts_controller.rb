class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    category = Category.find(params[:category_id])
    posts = category.posts.select(:id, :title, :content)
    render json: { posts: posts }
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.new(post_params)
    if @post.save
      redirect_to category_path(@category), notice: "포스트 작성 완료되었습니다."
    else
      flash.now[:alert] = '글 작성에 실패하였습니다.'
	  render 'categories/show'
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
