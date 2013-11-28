require File.expand_path(File.dirname(__FILE__) + '/helper')

# Topics API v2
res = Yahoo::Api.get(Yahoo::Api::News::Topics,{:pickupcategory => "sports"})
res["ResultSet"]["Result"].each do |v|
 p v["Title"]
end
