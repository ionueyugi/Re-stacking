class Publics::NotificationsController < Publics::ApplicationController
	before_action :authenticate_user!
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
    	notification.update_attributes(checked: true)
    end
  end
end

