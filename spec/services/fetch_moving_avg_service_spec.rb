require 'rails_helper'

describe FetchMovingAvgService do
  context 'When service is called' do
    let(:kline_params) {
      { :interval => "1h", :symbol => "ADABNB", :type => "close", :period => 2 }
    }

    let(:res_close) {
      {
        :data=>[
          ['2022-01-17 05:00:00 -0300'.to_datetime, 0.003155],
          ['2022-01-17 06:00:00 -0300'.to_datetime, 0.003209]
        ],
        :moving_avg=>0.003182
      }
    }

    it 'returns binance api response', :vcr do
      response = described_class.call(kline_params)
      expect(response).to eq(res_close)
    end
  end
end
