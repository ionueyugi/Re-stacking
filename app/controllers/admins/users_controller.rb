class Admins::UsersController < ApplicationController
  def index
  	@users = User.order(created_at: "DESC")
  end

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.order(created_at: "DESC")
    @favorites = Favorite.where(user_id: @user.id).order(created_at: "DESC")
    @post_comments = PostComment.where(user_id: @user.id).order(created_at: "DESC")
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path
  end

  private
  def user_params
  	  params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :nick_name, :goal, :profile_image, :email)
  end
end
