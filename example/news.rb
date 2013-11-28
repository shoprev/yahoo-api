require File.expand_path(File.dirname(__FILE__) + '/helper')

# Topics API v2
res = Yahoo::Api.get(Yahoo::Api::News::Topics,{:category_id => "13457"})

# res["ResultSet"]["totalResultsReturned"].times do |i|
#   p res["ResultSet"]["0"]["Result"]["#{i}"]["Code"]
# end
# res["ResultSet"]["0"]["Result"].each do |i,v|
#   next unless i =~ /\d+/
#   p v["Code"]
# end
