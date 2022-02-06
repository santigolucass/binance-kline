class FetchKlinesService < ApplicationService
  attr_reader :symbol, :interval

  def initialize(symbol, interval)
    @symbol = symbol || 'ADABNB'
    @interval = interval || '1h'
  end

  def call
    return 'Binance api url not defined' if ENV['BINANCE_KLINE_API_URL'].blank?

    fetch_klines
  end

  private

  def fetch_klines
    query = {
      'symbol' => symbol,
      'interval' => interval
    }

    begin
      res = HTTParty.get(
        ENV['BINANCE_KLINE_API_URL'],
        query: query
      )
    rescue StandardError => e
      Rails.logger.error (["#{self.class} - #{e.class}: #{e.message}"] + e.backtrace).join("\n")
      'Something went wrong'
    end
  end
end
