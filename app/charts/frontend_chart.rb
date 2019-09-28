class FrontendChart
  UnknownLocation = Class.new(StandardError)
  DateRangeTooNarrow = Class.new(StandardError)
  DateRangeTooWide = Class.new(StandardError)

  LOCATION_SYMBOLS = %w[AB1 AB2 DD3 ER4 CD5].map(&:freeze).freeze
  MINIMUM_DATE_RANGE = 7
  MAXIMUM_DATE_RANGE = 100

  def initialize(params)
    @params = params
    sanitize_params
  end

  def results
    @dates.map do |date|
      value = LOCATION_SYMBOLS.find_index(@location_symbol).to_i * 100 + date.yday % 81
      { date: date, value: value }
    end
  end

  private

  def sanitize_params
    @dates = (@params[:start_date].to_date..@params[:finish_date].to_date).to_a
    @location_symbol = ([@params[:location_symbol]] & LOCATION_SYMBOLS).first
    raise UnknownLocation if @location_symbol.nil?
    raise DateRangeTooNarrow if @dates.size < MINIMUM_DATE_RANGE
    raise DateRangeTooWide if @dates.size > MAXIMUM_DATE_RANGE
  end
end
