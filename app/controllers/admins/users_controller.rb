class Admins::UsersController < Admins::ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.all
  end

  private
  def user_params
  	  params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :nick_name, :goal, :profile_image, :email)
  end
end
