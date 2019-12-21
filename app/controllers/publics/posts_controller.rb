class Publics::PostsController < Publics::ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = PostComment.where(post_id: @post.id)
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save!
      redirect_to posts_path
    else
          flash.now[:notbuy] = "お問い合わせフォームを記入してください"
          render 'index'
    end
  end

  def destroy
    @post = Post.find(post_params)
    @post.destroy
    redirect_to user_path(current_user)
  end

private
    def post_params
        params.require(:post).permit(:post_content, :post_image, :user_id, :likes_count)
    end
end

