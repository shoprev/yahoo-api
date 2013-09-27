require File.expand_path(File.dirname(__FILE__) + '/helper')

# Category Tree API v2
res = Yahoo::Api.get(Yahoo::Api::Auction::CategoryTree,{:category => "0"})
res["ResultSet"]["Result"]["ChildCategory"].each do |v|
  p v["CategoryId"]
end

# Category Leaf API v2
res = Yahoo::Api.get(Yahoo::Api::Auction::CategoryLeaf,{:category => "23336"})
res["ResultSet"]["Result"]["Item"].each do |v|
  p v["AuctionID"]
end

# Selling List API v2
res = Yahoo::Api.get(Yahoo::Api::Auction::SellingList,{:sellerID => "ichienshop55"})
res["ResultSet"]["Result"]["Item"].each do |v|
  p v["AuctionID"]
end

# Search API v2
res = Yahoo::Api.get(Yahoo::Api::Auction::Search,{:query => "au"})
res["ResultSet"]["Result"]["Item"].each do |v|
  p v["AuctionID"]
end

# Item API v2
res = Yahoo::Api.get(Yahoo::Api::Auction::Item,{:auctionID => "x297261554"})
p res["ResultSet"]["Result"]["Title"]

# Bid History API v1
res = Yahoo::Api.get(Yahoo::Api::Auction::BidHistory,{:auctionID => "x297261554"})
res["ResultSet"]["Result"].each do |v|
  p v["Bidder"]
end

# Bid History Detail API v1
res = Yahoo::Api.get(Yahoo::Api::Auction::BidHistoryDetail,{:auctionID => "x297261554"})
res["ResultSet"]["Result"].each do |v|
  p v["Bidder"]
end

# Show Q & A API v1
res = Yahoo::Api.get(Yahoo::Api::Auction::ShowQAndA,{:auctionID => "h180241200"})
res["ResultSet"]["Result"]["QandA"].each do |v|
  p v["Title"]
end

# Show Rating API v1
res = Yahoo::Api.get(Yahoo::Api::Auction::ShowRating,{:id => "kaz_vegi"})
res["ResultSet"]["Result"].each do |v|
  p v["Title"]
end