# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Take Away

## Chapter 6

- Create scaffold Product
- Webpack
  - Change version 4 to 5 to fix issue
  - `rails webpacker:install`
- Command
  - `rails db:migrate` vs `rake db:migrate`

## Chapter 7

- Regex
- Validates
- Fixtures
- Minitest vs rspec ??
- Method/function/helper
  - `cycle`
  - `strip_tags`
  - `truncate`
- Command
  - `rails test` == `rt`
  - `rails test:models`
  - `rails test:controllers`
  - `rails test test/models/product_test.rb`
  - `rails test test/models/product_test.rb:35`

## Chapter 8

- [Caching](https://guides.rubyonrails.org/v2.3/caching_with_rails.html)
  - Basic caching
  - Page caching
  - Action caching
  - Fragment caching
  - Sweepers
- Method/function/helper
  - `sanitize`
  - `number_to_currency`
  - `Product.order(:title) vs Product.order('title ASC)`
- Minitest
  - assert
  - assert_equal
  - assert_difference
  - assert_response
  - assert_select
- Command
  - Toggle development mode caching on/off `rails dev:cache`
  - Generate `Store` controller with `index` action: `rails generate controller Store index`

## Chapter 9

- Term
  - `controllers/concerns/*`: sharing code among controllers
  - throw/catch vs raise/rescue
- Method/function/helper
  - `button_to ...`, POST method
  - `link_to ...`, GET method
- Minitest
  - follow_redirect!
- Command
  - references & belongs_to: `rails g scaffold LineItem product:references cart:belongs_to`
  - (actually it's the same haha)