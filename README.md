# ADP UserInfo Product Client Library for Ruby

he ADP UserInfo Product Library can be used to obtain basic information about the user that is logged-in to the ADP application. The Library includes a sample application that can be run out-of-the-box to connect to the ADP Marketplace API test gateway. This library has a dependancy on the adp-connection library. Installing this library also installs the latest version of the adp-connection library, if not previously installed

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'adp-product-userinfo'
```

And then execute:
```sh
    $ bundle
```

Or install it yourself as:
```sh
    $ gem install adp-product-userinfo
```

## Usage

Start using the library by requiring the gem in your ruby files

```ruby
require 'adp/product/userinfo'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

A demo client is included that uses the adp-product-userinfo gem. Check it out.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adplabs/adp-userinfo-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the ADP Marketplace Open software code of conduct.


## License

The gem is available as open source under the terms of the Apache License 2.0 (http://www.apache.org/licenses/LICENSE-2.0).

