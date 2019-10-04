class RecruitmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  rescue_from FrontendChart::UnknownLocation, with: :unknown_location_error
  rescue_from FrontendChart::DateRangeTooNarrow, with: :date_range_too_narrow_error
  rescue_from FrontendChart::DateRangeTooWide, with: :date_range_too_wide_error

  def chart_data
    render json: { results: FrontendChart.new(params).results }
  end

  private

  def unknown_location_error
    render json: { error: 'Unknown location' }
  end

  def date_range_too_narrow_error
    render json: { error: "Date range too narrow. Minimum #{FrontendChart::MINIMUM_DATE_RANGE} days" }
  end

  def date_range_too_wide_error
    render json: { error: "Date range too wide. Muximum #{FrontendChart::MAXIMUM_DATE_RANGE} days" }
  end
end
