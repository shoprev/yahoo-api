require "yaml"
require "yahoo/api"

config = YAML.load_file(File.dirname(__FILE__)+'/config.yml')

Rakuten::Api.configure do |options|
  options[:appid] = config['appid']
  # options[:affiliate_type] = config['affiliate_type']
  # options[:affiliate_id] = config['affiliate_id']
end
