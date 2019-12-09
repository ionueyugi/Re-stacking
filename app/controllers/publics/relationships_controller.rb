class Publics::RelationshipsController < Publics::ApplicationController

	def create
	  @user = User.find(params[:follower_id])
	  current_user.follow(@user)
	  respond_to do |format|
	    format.html { redirect_to @user }
	    format.js
	  end
	end

	def destroy
	  @user = Relationship.find(params[:id]).follower
	  current_user.unfollow(@user)
	  respond_to do |format|
	    format.html { redirect_to @user }
	    format.js
	  end
	end

	private
  def relationship_params
  	  params.require(:relationship).permit(:follower_id)
  end
end
