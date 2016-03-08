# Load path and gems/bundler
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))+'../pkg'

require "bundler"
Bundler.require

# Local config
require "find"

# %w{config/initializers lib}.each do |load_path|
#   Find.find(load_path) { |f|
#     require f unless f.match(/\/\..+$/) || File.directory?(f)
#   }
# end


use Rack::Session::Pool
set :protection, :session => true

# Load app
require "adp_userinfo_ruby"
#run AdpConnectionRuby
AdpConnectionRuby.run!
