# Yahoo::Api

[![Gem Version](https://badge.fury.io/rb/yahoo-api.png)](http://badge.fury.io/rb/yahoo-api)
Ruby Yahoo Japan Web API ( Shopping & Auction supported ) 

## Installation

Add this line to your application's Gemfile:

    gem 'yahoo-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yahoo-api

## Usage

### Yahoo Shopping API

Refer to [Shopping Web API documentation](http://developer.yahoo.co.jp/webapi/shopping/) for more infomation.

```ruby
require 'yahoo/api'

# configure
Yahoo::Api.configure do |options|
  options[:appid] = 'your api id'
  options[:affiliate_type] = "vc or yid"
  options[:affiliate_id] = "your affiliate id"
end

# Item Search API v1
res = Yahoo::Api::Shopping.item_search({:category_id => "13457"})
res.code # 200
res.message # "OK"

res["ResultSet"]["totalResultsReturned"].times do |i|
  code = res["ResultSet"]["0"]["Result"]["#{i}"]["Code"]
  ...
end

or

res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  code = v["Code"]
  ...
end

# Category Ranking API v1
res = Yahoo::Api::Shopping.category_ranking({:category_id => "13457"})
res["ResultSet"]["totalResultsReturned"].times do |i|
  code = res["ResultSet"]["0"]["Result"]["#{i}"]["Code"]
  ...
end

# Category Search API v1
res = Yahoo::Api::Shopping.category_search({:category_id => "1"})
res["ResultSet"]["0"]["Result"]["Categories"]["Children"].each do |i,v|
  next unless i =~ /\d+/
  id = v["Id"]
  ...
end

# Item Lookup API v1 
res = Yahoo::Api::Shopping.item_lookup({:itemcode => "hair_haclm352nn"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  name = v["Name"]
  ...
end

# Query Ranking API v1
res = Yahoo::Api::Shopping.query_ranking({:category_id => "13457"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  url = v["Url"]
  ...
end

# Content Match Item API v1 
res = Yahoo::Api::Shopping.content_match_item({:url => "http://www.yahoo.co.jp/"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  name = v["Name"]
  ...
end

# Content Match Ranking API v1
res = Yahoo::Api::Shopping.content_match_ranking({:url => "http://www.yahoo.co.jp/"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  name = v["Name"]
  ...
end

# Get Module API v1
res = Yahoo::Api::Shopping.get_module({:category_id => "13457",:position => "eventrecommend"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  title = v["Title"]
  ...
end

# Event Search API v1
res = Yahoo::Api::Shopping.event_search({:event_type => "store"})
res["ResultSet"]["0"]["Result"].each do |i,v|
  next unless i =~ /\d+/
  code = v["EventCode"]
  ...
end

# Review Search API v1
res = Yahoo::Api::Shopping.review_search({:category_id => "13457"})
res["ResultSet"]["Result"].each do |v|
  code = v["Target"]["Code"]
  ...
end
```

### Yahoo Auction API

Refer to [Auction Web API documentation](http://developer.yahoo.co.jp/webapi/auctions/) for more infomation.

```ruby
# Category Tree API v2
res = Yahoo::Api::Auction.category_tree({:category => "0"})
res.code # 200
res.message # "OK"
res["ResultSet"]["Result"]["ChildCategory"].each do |v|
  id = v["CategoryId"]
  ...
end

# Category Leaf API v2
res = Yahoo::Api::Auction.category_leaf({:category => "23336"})
res["ResultSet"]["Result"]["Item"].each do |v|
  id = v["AuctionID"]
  ...
end

# Selling List API v2
res = Yahoo::Api::Auction.selling_list({:sellerID => "ichienshop55"})
res["ResultSet"]["Result"]["Item"].each do |v|
  id = v["AuctionID"]
  ...
end

# Search API v2
res = Yahoo::Api::Auction.item({:query => "au"})
res["ResultSet"]["Result"]["Item"].each do |v|
  id = v["AuctionID"]
  ...
end

# Item API v2
res = Yahoo::Api::Auction.item({:auctionID => "x297261554"})
title = res["ResultSet"]["Result"]["Title"]

# Bid History API v1
res = Yahoo::Api::Auction.bid_history({:auctionID => "x297261554"})
res["ResultSet"]["Result"].each do |v|
  id = v["Bidder"]
  ...
end

# Bid History Detail API v1
res = Yahoo::Api::Auction.bid_history_detail({:auctionID => "x297261554"})
res["ResultSet"]["Result"].each do |v|
  id = v["Bidder"]
  ...
end

# Show Q & A API v1
res = Yahoo::Api::Auction.show_q_and_a({:auctionID => "h180241200"})
res["ResultSet"]["Result"]["QandA"].each do |v|
  title = v["Title"]
  ...
end

# Show Rating API v1
res = Yahoo::Api::Auction.show_rating({:id => "kaz_vegi"})
res["ResultSet"]["Result"].each do |v|
  title = v["Title"]
  ...
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
