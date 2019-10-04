class RecruitmentsController < ApplicationController
  before_action :cors_set_access_control_headers

  rescue_from FrontendChart::UnknownLocation, with: :unknown_location_error
  rescue_from FrontendChart::DateRangeTooNarrow, with: :date_range_too_narrow_error
  rescue_from FrontendChart::DateRangeTooWide, with: :date_range_too_wide_error

  def chart_data
    render json: { results: FrontendChart.new(params).results }
  end

  private

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, PATCH, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

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
