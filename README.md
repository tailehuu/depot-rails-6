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

## Chapter 10

- Term
  - `product_path` vs `product_url`
- Command
  - Rollback migration `rails db:rollback`
  - Migration status `rails db:migrate:status`
  - Clear logs test `rails log:clear LOGS=test`

## Chapter 11

- Term
  - Action Cable
  - Channel, stream
  - Want to Google something? Wait, let's use Ruby Interactive - `ri`
    - `rvm docs generate all`
    - `ri '.order'`
- Method/function/helper
  - `escape_javascript() or j()`
  - `render_to_string()`
- Command
  - Generate product's channel `rails generate channel products`

## Chapter 12

- Term
  - `enum` in ApplicationRecord
  - Method/function/helper
    - form_with
      ```
        form_with(model: user, local: true) do |form|
          form.text_field ...
          form.number_field ...
          form.select ...
          form.submit ...
        end
      ```
    - form_tag
      ```
        form_tag do
          text_field_tag ...
          password_field_tag ...
          submit_tag ...
        end
      ```
  - `stale?` from actionpack. Use for caching
- Command
  - Default type is `string`, no need to add for example `name:string`: `rails g scaffold Order name address:text email pay_type:integer`
  - references: `rails g migration add_order_to_line_item order:references`
  - `rails dbconsole`

## Chapter 13

- Term
  - `React`: 
    - React is a javascript view library designed to quickly create dynamic user interfaces.
    - The core concept in React is `components`
    - A component is a view, backed by some sort of `state`
    - When the state changes, the view re-renders
    - The view can behave differently depending on the current state inside the component
  - `Webpack`: is a tool to manage the javascript files that we write.
  - `Webpacker`: Rails includes Webpacker, which provides configuration for Webpack. It's a gem.
  - `Turbolinks`: 
    - `turbolinks:load`
- Method/function/helper
  - `config.filter_parameters += [ :credit_card_number ]` in `config/application.rb`
- Command
  - Run system test: `rails test:system`
  - System test = End-to-end testing = Automation Testing

## Chapter 14

- Term
  - `Action Mailer`
  - `Active Job`
  - How to use files in `lib` dir?
    - `config.autoload_paths << "#{root}/lib"` in `config/application.rb`
- Method/function/helper
  - Mailer
    - `.deliver_now`
    - `.deliver_later`
  - Job
    - `.perform_now`
    - `.perform_later`
- Command
  - Generate mailer: `rails generate mailer Order received shipped`
  - Generate job:    `rails generate job charge_order`

## Chapter 15

- Term
- Method/function/helper
  - `has_secure_password`
  - `before_action` vs `before_filter`
    - both is the same/alias
    - `before_filter` removed in Rails `5.1`
  - `skip_before_action` vs `skip_before_filter`
    - same above
  - Testing
    - model:      `ActiveSupport::TestCase`
    - controller: `ActionDispatch::IntegrationTest`
    - mailer:     `ActionMailer::TestCase`
    - job:        `ActiveJob::TestCase`
    - system:     `ActionDispatch::SystemTestCase`
- Command
  - `rails generate scaffold User name:string password:digest`
  - `rails generate controller Sessions new create destroy`
  - `rails generate controller Admin index`
  - routes
    - `rails routes`
    - `http://localhost:3000/rails/info/routes`

## Chapter 16

- Term
  - gem `i18n-js`
    - copy locale files to js files to allow using the same localization
- Method/function/helper
- Command

## Chapter 17

- Term
  - `Action Mailbox`
    - to receive emails
  - `Action Text`
    - store rich text
  - `Active Storage`
    - the place to store email. e.g: AWS S3, GCP, Azure Storage or local 
- Method/function/helper
  - `.created_at.to_formatted_s(:long)`
  - `has_rich_text :response`
- Command
  - `rails action_mailbox:install`
  - `rails generate mailbox support`
  - Action MailBox - Conductor
    - `http://localhost:3000/rails/conductor/action_mailbox/inbound_emails`
  - `rails action_text:install`