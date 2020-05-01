# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
- 2.4.1

* System dependencies
- Postgresql

* Configuration

* Database creation

- bundle exec rails db:create

* Database initialization

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
