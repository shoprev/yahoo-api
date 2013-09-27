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
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V2/categoryTree", opts.merge(Yahoo::Api.options))
        end

        # Yahoo Auction Category Leaf API v2
        def category_leaf(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V2/categoryLeaf", opts.merge(Yahoo::Api.options))
        end

        # Yahoo Auction Selling List API v2
        def selling_list(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V2/sellingList", opts.merge(Yahoo::Api.options))
        end

        # Yahoo Auction Search API v2
        def search(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V2/search", opts.merge(Yahoo::Api.options))
        end

        # Yahoo Auction Item API v2
        def item(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V2/auctionItem", opts.merge(Yahoo::Api.options))
        end

        # Yahoo Auction Bid History API v1
        def bid_history(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V1/BidHistory", opts.merge(Yahoo::Api.options))
        end

        # Yahoo Auction Bid History Detail API v1
        def bid_history_detail(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V1/BidHistoryDetail", opts.merge(Yahoo::Api.options))
        end

        # Yahoo Auction Show Q & A API v1
        def show_q_and_a(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V1/ShowQandA", opts.merge(Yahoo::Api.options))
        end

        # Yahoo Auction Show Rating API v1
        def show_rating(opts={})
          opts[:output] = 'json'
          opts[:callback] = 'callback'
          Yahoo::Request.get("http://auctions.yahooapis.jp/AuctionWebService/V1/ShowRating", opts.merge(Yahoo::Api.options))
        end

      end

    end

  end

end