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

```ruby
require 'yahoo/api'

# configure
Yahoo::Api.configure do |options|
  options[:appid] = 'your api id'
  options[:affiliate_type] = "vc or yid"
  options[:affiliate_id] = "your affiliate id"
end

# Item Search API v1
res = Yahoo::Api.get(Yahoo::Api::Shopping::ItemSearch,{:category_id => "13457"})
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
```

See the [examples directory](https://github.com/shoprev/yahoo-api/tree/master/example) for more usage.

```ruby
# Yahoo Shopping Web API
Yahoo::Api::Shopping::ItemSearch          # Item Search API v1
Yahoo::Api::Shopping::CategoryRanking     # Category Ranking API v1
Yahoo::Api::Shopping::CategorySearch      # Category Search API v1
Yahoo::Api::Shopping::ItemLookup          # Item Lookup API v1 
Yahoo::Api::Shopping::QueryRanking        # Query Ranking API v1
Yahoo::Api::Shopping::ContentMatchItem    # Content Match Item API v1 
Yahoo::Api::Shopping::ContentMatchRanking # Content Match Ranking API v1
Yahoo::Api::Shopping::GetModule           # Get Module API v1
Yahoo::Api::Shopping::EventSearch         # Event Search API v1
Yahoo::Api::Shopping::ReviewSearch        # Review Search API v1
# Yahoo Auction Web API
Yahoo::Api::Auction::CategoryTree     # Category Tree API v2
Yahoo::Api::Auction::CategoryLeaf     # Category Leaf API v2
Yahoo::Api::Auction::SellingList      # Selling List API v2
Yahoo::Api::Auction::Search           # Search API v2
Yahoo::Api::Auction::Item             # Item API v2
Yahoo::Api::Auction::BidHistory       # Bid History API v1
Yahoo::Api::Auction::BidHistoryDetail # Bid History Detail API v1
Yahoo::Api::Auction::ShowQAndA        # Show Q & A API v1
Yahoo::Api::Auction::ShowRating       # Show Rating API v1
```

Refer to [Shopping Web API documentation](http://developer.yahoo.co.jp/webapi/shopping/) or [Auction Web API documentation](http://developer.yahoo.co.jp/webapi/auctions/) for more infomation.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
