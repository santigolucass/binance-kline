require 'rails_helper'

RSpec.describe KlinesController, type: :controller do

  let(:params) {
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

  context "GET #index" do
    it "returns a success response", :vcr do
      get :index, params: params
      expect(response).to be_successful
      expect(assigns(:data)).to eq(res_close)
    end
  end
end
