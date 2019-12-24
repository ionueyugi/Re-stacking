class Admins::PostsController < ApplicationController
  def index
  	@posts = Post.order(created_at: "DESC")
  end

  def show
  	@post = Post.find(params[:id])
    @post_comments = PostComment.where(post_id: @post.id).order(created_at: "DESC")
  end

  def destroy
  	@post = Post.find(params[:id])
    @post.destroy
    redirect_to admins_posts_path
  end

  private
    def post_params
        params.require(:post).permit(:post_content, :post_image, :user_id, :likes_count)
    end
end
