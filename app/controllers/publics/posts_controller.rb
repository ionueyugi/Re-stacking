class Publics::PostsController < Publics::ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(post_params)
    @post.destroy
    redirect_to posts_path
  end

private
    def post_params
        params.require(:post).permit(:post_content, :post_image)
    end
end

