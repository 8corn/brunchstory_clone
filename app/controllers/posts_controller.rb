class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts.order(created_at: :desc)
    
	render :index
  end

  def show
	  @post = Post.find(params[:id])
	  @comments = @post.comments
	  @comment = @post.comments.build
  end
  
  def new
	@category = Category.find(params[:category_id])
	@post = @category.posts.build
  end

  def edit
	  @post = Post.find(params[:id])
  end

  def create
  	@category = Category.find(params[:category_id])
  	@post = @category.posts.build(post_params)
  	@post.account = current_account

	if @post.save
		redirect_to category_path(@category), notice: '글 작성을 성공하였습니다.'
	else
		flash.now[:alert] = '글 작성에 실패하였습니다.'
		render :new, status: :unprocessable_entity
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
	@category = @post.category
    @post.destroy
	redirect_to category_path(@category), notice: '글이 성공적으로 삭제되었습니다.'
  end
	
  def like
    @post = Post.find(params[:id])
	like = @post.likes.find_by(account_id: current_account.id)
	  
	if like.nil?
    	@post.likes.create!(account_id: current_account.id)
    	redirect_to category_post_path(@post.category, @post), notice: '좋아요를 눌렀습니다!'
	else
		like.destroy
		redirect_to category_post_path(@post.category, @post), notice: '좋아요를 취소습니다.'
	end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
    	params.require(:post).permit(:title, :content, :likes)
    end
end
