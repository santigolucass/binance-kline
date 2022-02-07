require 'rails_helper'

describe FetchKlinesService do
  context 'When service is called' do
    let(:symbol) { 'ADABNB' }
    let(:interval) { '1h' }

    it 'returns binance api response', :vcr do
      response = described_class.call(symbol, interval)
      expect(response.code).to eq(200)
    end

    context 'and api url is not defined' do
      it 'returns an error message' do
        # Backup binance URL
        binance_url = ENV['BINANCE_KLINE_API_URL']
        ENV['BINANCE_KLINE_API_URL'] = nil

        response = described_class.call(symbol, interval)
        expect(response).to eq('Binance api url not defined')

        # Set back binance api url in order to prevent error in other scenarios
        ENV['BINANCE_KLINE_API_URL'] = binance_url
      end
    end
  end
end
