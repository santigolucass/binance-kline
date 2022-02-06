Rails.application.routes.draw do
  root 'klines#index'
  get '/klines_average', to: 'klines#index'
end
