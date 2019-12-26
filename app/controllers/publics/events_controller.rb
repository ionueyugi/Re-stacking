class Publics::EventsController < Publics::ApplicationController

  before_action :authenticate_user!

  def index
  	@events = Event.where(user_id: current_user.id)
  end

  def create
    @event = Event.new
    event = Event.new
    event.attributes = {
      title: params[:title],
      body: params[:body],
      start: params[:start],
      end: params[:end],
      user_id: current_user.id
    }
    event.save
    @evaluation = Evaluation.new
  	@evaluation.event_id = event.id
  	@evaluation.save
  	event.evaluation_id = @evaluation.id
  	event.update(evaluation_id: @evaluation.id)
    @events = Event.where(user_id: current_user.id)
  end

  def update
  	event = Event.find(params[:id])
  	event.attributes = {
      title: params[:title],
      body: params[:body],
      start: params[:start],
      end: params[:end],
      evaluation_id: params[:evaluation_id],
      user_id: current_user.id
    }
    event.update(event_params)
    redirect_to events_path
  end

  def destroy
  	event = Event.find(params[:id])
  	event.destroy
  	redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:user_id, :evaluation_id, :title, :start, :end, :body)
    end
end

