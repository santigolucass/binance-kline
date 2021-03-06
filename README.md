# Binance Klines

![alt text](https://github.com/santigolucass/binance-kline/blob/main/public/home.png?raw=true)

> Demo project to show historic and moving average of Binance Klines


## 💻 Requirements

You'll need:
* Docker
* Docker compose

## 🚀 Running <Binance Kline>

Follow those simple steps:

First, build the app:
```
docker-compose build
```

Then start the containers:
```
docker-compose up
```
  
And then you can just access [localhost](https://localhost:3000)

## 📝 Running tests

  To run tests inside the container, use the following command:
```
docker-compose run -e "RAILS_ENV=test" app rspec
```
The above command will run all tests in the project, to run them separately use:
  ```
docker-compose run -e "RAILS_ENV=test" app rspec path/to/file.rb
```
  
  
