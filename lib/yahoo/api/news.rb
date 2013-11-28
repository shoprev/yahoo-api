module Yahoo

  class Api

    class News

      Topics = "Yahoo::Api::News.topics"

      class << self
        
        # Yahoo News Topics API v2
        def topics(opts={})
          Yahoo::Request.get("http://news.yahooapis.jp/NewsWebService/V2/topics", Yahoo::Api.merge(opts), "xml")
        end

      end

    end

  end

end
