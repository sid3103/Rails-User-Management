class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	def index
		@post = Post.all
    @post = Post.includes(:resumes)
	end

	def new
		@post = Post.new
    authorize @post
	end

	def create
	  @post = Post.new(post_params)
    authorize @post
	  @post.save
    redirect_to posts_path
  end  

  def show

  end   

  def edit
    authorize @post, :update?
  end

  def update
   	@post.update(post_params)
   	redirect_to posts_path
  end

  def destroy
   	@post.destroy
    authorize @post
   	redirect_to posts_path
  end

  def set_post
  	@post = Post.find(params[:id])
  end
  def post_params
  	params.require(:post).permit(:title, :body)
  end

end
