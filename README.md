# README

This is a simple rails application for searching vehicles based on attribute of vehicle.
We have used postgresql for storing the data and used ransack for implementing search feature.

This application is deployed on heroku and accessible by below the link.

https://vehicleshop.herokuapp.com/

Things you may want to cover:

* Ruby version
- 2.4.1

* System dependencies
- Postgresql

* Configuration

* Database creation

- bundle exec rails db:create

* Database initialization

- rails db:setup

* How to run the test suite

- bundle exec rake db:test:prepare
- bundle exec rake spec
- SIMPLECOV=true bundle exec rake spec
- bundle exec brakeman --exit-on-warn

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Rake Task

# Import Vehicle CSV file

- rake imports:vehicles["db/data/vehicles_list_2.csv"]

# Improvement
-  We could improve line number 42 and 51 from `services/vehicles/parse_vehicle.rb` file.
This could be improve by using in memory storage or redis.

- Also we could explore ElasticSearch if dealing with large data set.

