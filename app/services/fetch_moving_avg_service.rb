class FetchMovingAvgService < ApplicationService
  include Calculations

  attr_reader :type, :kline_params, :period

  TYPES = {
    open: 1,
    high: 2,
    low: 3,
    close: 4
  }.freeze

  def initialize(kline_params)
    @kline_params = kline_params
    @type = TYPES[kline_params[:type].to_sym]
    @period = kline_params[:period].to_i
  end

  def call
    data = fetch_klines

    {
      data: data,
      moving_avg: moving_average(data.map{ |e| e[1] }, period)
    }
  end

  private

  def fetch_klines
    klines = FetchKlinesService.call(kline_params[:symbol], kline_params[:interval])
    add_formatted_date(klines)
  end

  def add_formatted_date(klines)
    klines.take(period).map do |record|
      [Time.strptime(record[0].to_s, '%Q'), record[type].to_f]
    end
  end
end
