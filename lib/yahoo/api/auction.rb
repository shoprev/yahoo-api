module Yahoo

  class Api

    class Auction

      CategoryTree = "Yahoo::Api::Auction.category_tree"
      CategoryLeaf = "Yahoo::Api::Auction.category_leaf"
      SellingList = "Yahoo::Api::Auction.selling_list"
      Search = "Yahoo::Api::Auction.search"
      Item = "Yahoo::Api::Auction.item"
      BidHistory = "Yahoo::Api::Auction.bid_history"
      BidHistoryDetail = "Yahoo::Api::Auction.bid_history_detail"
      ShowQAndA = "Yahoo::Api::Auction.show_q_and_a"
      ShowRating = "Yahoo::Api::Auction.show_rating"

      class << self
        
        # Yahoo Auction Category Tree API v2
        def category_tree(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V2/categoryTree", Yahoo::Api.merge(opts))
        end

        # Yahoo Auction Category Leaf API v2
        def category_leaf(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V2/categoryLeaf", Yahoo::Api.merge(opts))
        end

        # Yahoo Auction Selling List API v2
        def selling_list(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V2/sellingList", Yahoo::Api.merge(opts))
        end

        # Yahoo Auction Search API v2
        def search(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V2/search", Yahoo::Api.merge(opts))
        end

        # Yahoo Auction Item API v2
        def item(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V2/auctionItem", Yahoo::Api.merge(opts))
        end

        # Yahoo Auction Bid History API v1
        def bid_history(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V1/BidHistory", Yahoo::Api.merge(opts))
        end

        # Yahoo Auction Bid History Detail API v1
        def bid_history_detail(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V1/BidHistoryDetail", Yahoo::Api.merge(opts))
        end

        # Yahoo Auction Show Q & A API v1
        def show_q_and_a(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V1/ShowQandA", Yahoo::Api.merge(opts))
        end

        # Yahoo Auction Show Rating API v1
        def show_rating(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V1/ShowRating", Yahoo::Api.merge(opts))
        end

      end

    end

  end

end