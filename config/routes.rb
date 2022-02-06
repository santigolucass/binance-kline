Rails.application.routes.draw do
  get '/klines_average', to: 'klines#index'
end
