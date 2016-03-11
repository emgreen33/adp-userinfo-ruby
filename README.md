# ADP Userinfo Product Client Library for Ruby

The ADP Userinfo Product Client Library is used to obtain basic information about the user that is logged-in to the ADP application. The Library includes a sample demo client application that can be run out-of-the-box to connect to the ADP Marketplace API **test** gateway. This library has a dependancy on the adp-connection library. Installing this library also installs the latest version of the adp-connection library, if not previously installed.

### Version
1.0.0 (Beta)


## Installation

There are two ways of installing and using this library:

  - Clone the repo from Github: This allows you to access the raw source code of the library as well as provide the ability to run the sample demo client application and view the Library documentation
  - Install gem from package store RubyGems.org(https://github.com/adplabs/adp-userinfo-ruby): When you are ready to use the library in your own application use this method to install it using gem/bundle


**Clone from Github**

You can either use the links on Github or the command line git instructions below to clone the repo.

```sh

$ git clone https://github.com/adplabs/adp-userinfo-ruby adp-userinfo-ruby

```

followed by

```sh

$ cd adp-userinfo-ruby
$ gem install bundler
$ bundle install
$ rake -T
$ rake install:local

```

*Run the sample demo client app*

```sh

$ cd ./democlient
$ bundle install
$ rackup

```

This starts an HTTP server on port 8889 (this port must be unused to run the sample application). You can point your browser to http://localhost:8889. The sample app allows you to connect to the ADP test API Gateway using the **client_credentials** and **authorization_code** grant types. For the **authorization_code** connection, you will be asked to provide an ADP username (MKPLDEMO) and password (marketplace1).

***


**Install gem from package store RubyGems.org**

Add this line to your application's Gemfile:

```ruby

gem 'adp-connection'
gem 'adp-product-userinfo'

```

And then execute:

```sh

    $ bundle install

```

Or install it yourself as:

```sh

    $ gem install adp-product-userinfo

```

## Usage

Start using the library by requiring the gem in your ruby files

```ruby

require 'adp/connection'
require 'adp/product/userinfo'

```


## Development
After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

A demo client is included that uses the adp-product-userinfo gem. Check it out.


## Examples
### Create Client Credentials ADP Connection

Here is a Sinatra (http://www.sinatrarb.com/) example

```ruby

require 'yaml'
require 'tilt/erb'
require 'logger'
require 'adp/connection'
require 'adp/product/userinfo'

clientcredential_config = YAML.load(ERB.new(File.read('config/clientcredential_config.yml')).result)
authorizationcode_config = YAML.load(ERB.new(File.read('config/authorizationcode_config.yml')).result)

configure do
  Log = Logger.new(STDOUT);
  #Logger.new("sinatra.log")
  Log.level  = Logger::DEBUG
end

class AdpConnectionRuby < Sinatra::Base

  enable :sessions
  set :public_folder => "public", :static => true

  #set :protection, :session => true
  set :port, 8889

  results = {
      :message =>  "Welcome",
      :auth_type => nil
  }

  get '/client_credentials/login' do
    results[:auth_type] = :client_credentials
    results[:message] = nil
    connection = session["ClientCredential"]
    results[:userinfo] = nil

    if (connection.nil?)

      # get new connection configuration
      # YAML config object placed in yaml configuration files
      config = YAML.load_file('config/clientcredential_config.yml');

      if (!config || config.nil?)
        results[:message] = "Unable to load configuration settings from file (config/clientcredential_config.yml)"
      else
        begin
          clientcredential_config = Adp::Connection::ClientCredentialConfiguration.new(config);

          connection = Adp::Connection::ApiConnectionFactory::createConnection(clientcredential_config)

          connection.connect();

          if (!connection.is_connected_indicator?)
            results[:message] = "Error attempting to establish a connection"
            Log.error "Not connected"
          else
            Log.debug("Connected and ready for getting data");
            session["ClientCredential"] = connection;
          end
        end
      end
    end
    erb :client_credentials, :locals => { :view_bag => results }
  end


  get '/authorization_code/get_userinfo' do
    results[:auth_type] = :authorization_code
    results[:message] = nil
    connection = session["AuthorizationCode"]

    begin
      Log.debug("Do we have a connection object? #{connection}")
      unless connection.nil? || connection.connection_configuration.authorizationCode.nil?
        Log.debug("Check if we are connected: #{connection.access_token}")
        if (connection.is_connected_indicator?)
          Log.debug("Getting helper object")
            helper = Adp::Product::Userinfo::Helper.new(connection)
          Log.debug("getting userinfo using helper object")
            json_data = helper.get_user_info()
            results[:userinfo] = Adp::Product::DTO::Userinfo.new(json_data)

            Log.debug("Got user info #{json_data}")
        end
      end
      Log.debug("Done getting userinfo #{results[:userinfo]}")
    rescue Adp::Connection::ConnectionException
      e = env['sinatra.error']
      results[:message] = "Connection error: #{e}"
    end

    erb :authorization_code, :locals => { :view_bag => results}
  end

end


```


## API Documentation ##

Documentation on the individual API calls provided by the library is automatically generated from the library code. To generate the documentation, please complete the following steps:

```
# not applicable
```

## Tests ##

Automated unit tests are available in tests folder. To run the tests, please complete the following steps.

```
rake spec
```

The above will also display tests results. 

## Code Coverage ##

```
# not applicable
```

The resulting report can be viewed by opening htmlcov/index.html in your browser.

## Dependencies ##

This library has the following **install** dependencies. These are installed automatically as part of the 'bundle install' or 'gem install adp-product-userinfo' if they don't exist.

* json
* adp-connection

This library has the following **development/test** dependencies. These are installed automatically as part of the 'bundle install' if they don't exist.

* bundler
* rake
* rspec

## Contributing ##

To contribute to the library, please generate a pull request. Before generating the pull request, please insure the following:

1. Appropriate unit tests have been updated or created.
2. Code coverage on the unit tests must be no less than 95%.
3. Your code updates have been fully tested.
4. Update README.md and API documentation as appropriate.

Author: Junior Napier

## License ##
The gem is available as open source under the terms of the Apache License 2.0 (http://www.apache.org/licenses/LICENSE-2.0).

