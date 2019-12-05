class Publics::PostsController < Publics::ApplicationController
  def index
  end

  def show
  end

  def new
  	 @post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	@post.save
  	redirect_to user_path(current_user)
  end

  def destroy
  end

private
    def post_params
        params.require(:post).permit(:post_content, :post_image)
    end
end

