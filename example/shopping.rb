require File.expand_path(File.dirname(__FILE__) + '/helper')

# Item Search API v1
res = Yahoo::Api.get(Yahoo::Api::Shopping::ItemSearch,{:category_id => "13457"})
res["ResultSet"]["totalResultsReturned"].times do |i|
  p res["ResultSet"]["0"]["Result"]["#{i}"]["Code"]
end
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  p v["Code"]
end

# Category Ranking API v1
res = Yahoo::Api.get(Yahoo::Api::Shopping::CategoryRanking,{:category_id => "13457"})
res["ResultSet"]["totalResultsReturned"].times do |i|
  p res["ResultSet"]["0"]["Result"]["#{i}"]["Code"]
end

# Category Search API v1
res = Yahoo::Api.get(Yahoo::Api::Shopping::CategorySearch,{:category_id => "1"})
res["ResultSet"]["0"]["Result"]["Categories"]["Children"].each do |i,v|
  next unless i =~ /\d+/
  p v["Id"]
end

# Item Lookup API v1 
res = Yahoo::Api.get(Yahoo::Api::Shopping::ItemLookup,{:itemcode => "hair_haclm352nn"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  p v["Name"]
end

# Query Ranking API v1
res = Yahoo::Api.get(Yahoo::Api::Shopping::QueryRanking,{:category_id => "13457"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  p v["Url"]
end

# Content Match Item API v1 
res = Yahoo::Api.get(Yahoo::Api::Shopping::ContentMatchItem,{:url => "http://www.yahoo.co.jp/"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  p v["Name"]
end

# Content Match Ranking API v1
res = Yahoo::Api.get(Yahoo::Api::Shopping::ContentMatchRanking,{:url => "http://www.yahoo.co.jp/"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  p v["Name"]
end

# Get Module API v1
res = Yahoo::Api.get(Yahoo::Api::Shopping::GetModule,{:category_id => "13457",:position => "eventrecommend"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  p v["Title"]
end

# Event Search API v1
res = Yahoo::Api.get(Yahoo::Api::Shopping::EventSearch,{:event_type => "store"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  p v["EventCode"]
end

# Review Search API v1
res = Yahoo::Api.get(Yahoo::Api::Shopping::ReviewSearch,{:category_id => "13457"})
res["ResultSet"]["Result"].each do |v|
  p v["Target"]["Code"]
end