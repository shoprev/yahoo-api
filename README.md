# Yahoo::Api

[![Gem Version](https://badge.fury.io/rb/yahoo-api.png)](http://badge.fury.io/rb/yahoo-api)
Ruby Yahoo Web API ( Shopping & Auction ) 

## Installation

Add this line to your application's Gemfile:

    gem 'yahoo-api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yahoo-api

## Usage

### Yahoo Shopping API

Yahoo Shopping Item Search API v1

    res = Yahoo::Api::Shopping.item_search({:category_id => 13457})
    res.code # 200
    res.message # "OK"
    res["ResultSet"]["totalResultsReturned"].times 

Yahoo Shopping Category Ranking API v1
    def category_ranking(opts={})
      Request.get("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/categoryRanking", opts.merge(Yahoo::Api.options))
    end

Yahoo Shopping Category Search API v1
    def category_search(opts={})
      Request.get("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/categorySearch", opts.merge(Yahoo::Api.options))
    end

Yahoo Shopping Item Lookup API v1 
    def item_lookup(opts={})
      Request.get("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/itemLookup", opts.merge(Yahoo::Api.options))
    end

Yahoo Shopping Query Ranking API v1
    def query_ranking(opts={})
      Request.get("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/queryRanking", opts.merge(Yahoo::Api.options))
    end

Yahoo Shopping Content Match Item API v1 
    def content_match_item(opts={})
      Request.get("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/contentMatchItem", opts.merge(Yahoo::Api.options))
    end

Yahoo Shopping Content Match Ranking API v1
    def content_match_ranking(opts={})
      Request.get("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/contentMatchRanking", opts.merge(Yahoo::Api.options))
    end

Yahoo Shopping Get Module API v1
    def get_module(opts={})
      Request.get("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/getModule", opts.merge(Yahoo::Api.options))
    end

Yahoo Shopping Event Search API v1
    def event_search(opts={})
      Request.get("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/eventSearch", opts.merge(Yahoo::Api.options))
    end

Yahoo Shopping Review Search API v1
    def review_search(opts={})
      Request.get("http://shopping.yahooapis.jp/ShoppingWebService/V1/json/reviewSearch", opts.merge(Yahoo::Api.options))
    end

### Yahoo Auction API

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
