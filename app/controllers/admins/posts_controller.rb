class Admins::PostsController < Admins::ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = PostComment.where(post_id: @post.id)
  end

  def destroy
  	@post = Post.find(post_params)
    @post.destroy
    redirect_to admins_posts_path
  end
end
