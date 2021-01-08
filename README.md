# EnumTranslatable
Translating enums has never been easier!

A simple Gem that translates ruby on rails enums in a similar manner to I18n globalize gem.
Gem: https://rubygems.org/gems/enum_translatable
## Installation
Make sure you add globalize gem https://github.com/globalize/globalize

Add this line to your application's Gemfile:

```ruby
gem 'enum_translatable', '~> 0.1.3'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install enum_translatable

## Usage


The Gem will add some methods into your selected model similar to what globalize gem adds to a translated field.
for example if we have the following class
````ruby
class Order  < ApplicationRecord
    enum status:{
        pending: 0,
        canceled: 1,
        approved: 2,
    }
end
````

by adding the following
````ruby
class Order  < ApplicationRecord
    enum status:{
        pending: 0,
        canceled: 1,
        approved: 2,
    }
    include EnumTranslatable ##this has to be added after the last enum defined in your model which needs to be translated
    #Note: Adding this line will translate ALL the enums defined above it.
end
````
Then adding the translations in your local.yml
````yml
#en.yml
en:
  activerecord:
    enum_translatable:
      order:
        status:
          canceled: "canceled"
          pending: "pending"
          approved: "approved"
````
````yml
#ar.yml
ar:
  activerecord:
    enum_translatable:
      order:
        status:
          canceled: "canceled in arabic"
          pending: "pending in arabic"
          approved: "approved in arabic"
````
````yml
#es.yml
es:
  activerecord:
    enum_translatable:
      order:
        status:
          canceled: "canceled in spanish"
          pending: "pending in spanish"
          approved: "approved in spanish"
````
it will add the following methods

````ruby
#default locale is :en
order = Order.first
order.status # => "canceled"
order.status_en # => "canceled"
order.status_ar # => "canceled in arabic"
order.status_es # => "canceled in spanish"
I18.locale = :ar
order.status = "canceled in arabic"
I18.locale = :es
order.status = "canceled in spanish"
````

Make sure to add the locales you want to use, other wise you will have a method for each I18n locale which is unecessary
````ruby
# in config/initializer/locale.rb
I18n.available_locales = [:ar, :es, :en]
````
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/enum_translatable.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
