module Publics::NotificationsHelper

  	def unchecked_notifications
      @notifications=current_user.passive_notifications.where(checked: false)
  	end

	def notification_form(notification)
	    @comment = nil
	    visitor = notification.visitor.nick_name
	    case notification.action
	      when "follow" then
	        "#{visitor}があなたをフォローしました"
	      when "like" then
	      	your_post = notification.post.post_content
	        "#{visitor}が#{your_post}にいいね！しました"
	      when "comment" then
	      	your_post = notification.post.post_content
	        @comment = Comment.find_by(id:notification.comment_id)&.content
	        "#{visitor}が#{your_post}にコメントしました"
  		end
  	end
end
