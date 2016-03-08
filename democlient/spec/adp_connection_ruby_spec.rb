require_relative "spec_helper"
require_relative "../adp_userinfo_ruby.rb"

def app
  AdpConnectionRuby
end

describe AdpConnectionRuby do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
