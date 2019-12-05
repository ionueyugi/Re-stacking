class Publics::UsersController <  Publics::ApplicationController
  def show
  	  @user = User.find(params[:id])
  	end

  def update
  end
end
