class Publics::EvaluationsController < ApplicationController

  before_action :authenticate_user!

  def show
  	@evaluation = Evaluation.find(params[:id])
  	gon.achievement_targetvalue = @evaluation.achievement_targetvalue_score
  	gon.quality_targetvalue = @evaluation.quality_targetvalue_score
  	gon.time_targetvalue = @evaluation.time_targetvalue_score
  	gon.achievement = @evaluation.achievement_score
  	gon.quality = @evaluation.quality_score
  	gon.time = @evaluation.time_score
  	@total_point = @evaluation.achievement_score.to_i + @evaluation.quality_score.to_i + @evaluation.time_score.to_i
  	@result1 = Result.find(1)
  	@result2 = Result.find(2)
  	@result3 = Result.find(3)
  	@result4 = Result.find(4)
  end

  def create
  end

  def update
  	@evaluation = Evaluation.find(params[:id])
  	@evaluation.update(evaluation_params)
  	respond_to do |format|
	    format.html { redirect_to @evaluation }
	    format.js
	  end
	  redirect_to evaluation_path(@evaluation)
  end
end

def evaluation_params
      params.require(:evaluation).permit(:event_id, :achievement_score, :quality_score, :time_score, :total_point, :memo, :achievement_targetvalue_score, :quality_targetvalue_score, :time_targetvalue_score)
end