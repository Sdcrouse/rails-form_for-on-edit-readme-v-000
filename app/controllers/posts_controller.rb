class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new
	  @post.title = params[:title]
	  @post.description = params[:description]
	  @post.save
	  redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  # @post.update(title: params[:title], description: params[:description])
    @post.update(params.require(:post).permit(:title, :description))

    # Interesting. This works as well:
    # @post.update(title: params[:post][:title], description: params[:post][:description])
    # But THIS generates a ForbiddenAttributesError:
    # @post.update(params[:post])

    redirect_to post_path(@post)
	end
end