class KlinesController < ApplicationController

  def index
    @data = FetchMovingAvgService.call(kline_params)
  end

  def kline_params
    params.permit(:symbol, :interval, :type, :period)
  end
end
