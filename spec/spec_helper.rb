# coding: utf-8
require 'webmock/rspec'
WebMock.disable_net_connect!
require 'vcr'

VCR.configure do |c|  
  c.cassette_library_dir = File.expand_path(File.dirname(__FILE__) + '/fixtures')
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end

require File.expand_path(File.dirname(__FILE__) + '/../lib/yahoo/api')

Yahoo::Api.configure do |options|
  options[:appid] = 'your api id'
  options[:affiliate_type] = "vc or yid"
  options[:affiliate_id] = "your affiliate id"
end
