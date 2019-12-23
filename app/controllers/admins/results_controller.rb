class Admins::ResultsController < ApplicationController
  def index
  	@result1 = Result.find(1)
  	@result2 = Result.find(2)
  	@result3 = Result.find(3)
  	@result4 = Result.find(4)
  end

  def update
  	@result1 = Result.find(1)
  	@result1.update(result_params)
  	redirect_to admins_result_path
  end

  private
  def result_params
  	  params.require(:result).permit(:result_content)
  end
end
