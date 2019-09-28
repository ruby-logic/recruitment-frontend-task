class RecruitmentsController < ApplicationController
  def chart_data
    render json: { results: FrontendChart.new(params).results }
  end
end
