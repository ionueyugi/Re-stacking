class Publics::PostsController < Publics::ApplicationController
  def index
    @posts = Post.order(created_at: "DESC")
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = PostComment.where(post_id: @post.id).order(created_at: "DESC")
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save!
      respond_to do |format|
      format.html { redirect_to @posts }
      format.js
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user)
  end

private
    def post_params
        params.require(:post).permit(:post_content, :post_image, :user_id, :likes_count)
    end
end

