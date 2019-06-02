# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adp/product/userinfo/version'

Gem::Specification.new do |spec|
  spec.name          = "adp-product-userinfo"
  spec.version       = Adp::Product::Userinfo::VERSION
  spec.authors       = ["Napier, Junior (CORP)"]
  spec.email         = ["Junior.Napier@gmail.com"]
  # spec.owners        = ["ADP Marketplace, ADP Inc."]

  spec.summary       = %q{ADP Ruby UserInfo product client library to get the logged-in user's info.}
  spec.description   = %q{The ADP UserInfo Product Library can be used to obtain basic information about the user that is logged-in to the ADP application. The Library includes a sample application that can be run out-of-the-box to connect to the ADP Marketplace API test gateway. This library has a dependancy on the adp-connection library. Installing this library also installs the latest version of the adp-connection library, if not previously installed.}
  spec.homepage      = "https://github.com/adplabs/adp-userinfo-ruby"
  spec.license       = "Apache-2.0"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # spec.add_dependency "uri"
  # spec.add_dependency "net/https"
  # spec.add_dependency "base64"
  # spec.add_dependency "json", '~> 1.8'
  # spec.add_dependency 'securerandom'
  # spec.add_dependency 'adp-connection'

  spec.add_development_dependency "bundler", "~> 2.0.1"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
