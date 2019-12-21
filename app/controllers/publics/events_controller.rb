class Publics::EventsController < Publics::ApplicationController
  def index
  	@events = Event.where(user_id: current_user.id)
  end

  def create
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
    respond_to do |format|
    	format.html { redirect_to @events }
	    format.js
		format.json {
		    render json:
		    @event.to_json(only: [:title, :start, :end, :body])
		}
    end
    redirect_to events_path
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
    event.update
    respond_to do |format|
    	format.html { redirect_to @events }
	    format.js
      	format.json {
        	render json:
        	@event.to_json(only: [:title, :start, :end, :body ])
      	}
    end
    redirect_to events_path
  end

  def destroy
  end

  private
    def event_params
      params.require(:event).permit(:user_id, :evaluation_id, :title, :start, :end, :body)
    end
end

