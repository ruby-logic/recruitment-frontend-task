class FrontendChart
  LOCATION_SYMBOLS = %w[
    AB1
    AB2
    DD3
    ER4
    CD5
  ].map(&:freeze).freeze

  def initialize(params)
    @params = params
  end

  def results
    (1..12).map { |i| { date: Date.current + i.days, value: i * 100 } }
  end

  private

  def
end
