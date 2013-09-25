require "yahoo/api"
Yahoo::Api.configure do |options|
  options[:appid] = 'dj0zaiZpPVBzbEY1RWlSNVd2biZzPWNvbnN1bWVyc2VjcmV0Jng9MTU-'
end

# http://shopping.yahooapis.jp/ShoppingWebService/V1/json/reviewSearch?appid=dj0zaiZpPVBzbEY1RWlSNVd2biZzPWNvbnN1bWVyc2VjcmV0Jng9MTU-&category_id=13457
    res = Yahoo::Api::Shopping.review_search({:category_id => "13457"})
# p res["ResultSet"]["Result"][]
    res["ResultSet"]["Result"].each do |v|
      # next unless i =~ /\d+/
     p code = v["Target"]["Code"]
    end
    # res = Yahoo::Api::Shopping.event_search({:event_type => "store"})
    # res["ResultSet"]["0"]["Result"].each do |i,v|
    #   next unless i =~ /\d+/
    #   p code = v["EventCode"]
    # end
    # res = Yahoo::Api::Shopping.get_module({:category_id => "13457",:position => "eventrecommend"})
    # res["ResultSet"]["0"]["Result"].each do |i,v|
    #   next unless i =~ /\d+/
    #   p title = v["Title"]
    # end

    # res = Yahoo::Api::Shopping.content_match_ranking({:url => "http://www.yahoo.co.jp/"})
    # res["ResultSet"]["0"]["Result"].each do |i,v|
    #   next unless i =~ /\d+/
    #   p name = v["Name"]
    # end
    # res = Yahoo::Api::Shopping.content_match_item({:url => "http://www.yahoo.co.jp/"})
    # res["ResultSet"]["0"]["Result"].each do |i,v|
    #   next unless i =~ /\d+/
    #   p name = v["Name"]
    # end
    # res = Yahoo::Api::Shopping.query_ranking({:category_id => "13457"})
    # res["ResultSet"]["0"]["Result"].each do |i,v|
    #   next unless i =~ /\d+/
    #   p url = v["Url"]
    # end
    # res = Yahoo::Api::Shopping.item_lookup({:itemcode => "hair_haclm352nn"})
    # res["ResultSet"]["0"]["Result"].each do |i,v|
    #   next unless i =~ /\d+/
    #   p name = v["Name"]
    # end
#     res = Yahoo::Api::Shopping.category_search({:category_id => "1"})
#     res["ResultSet"]["0"]["Result"]["Categories"]["Children"].each do |k,v|
#       p id = v["Id"]
#       next if id.nil?
#     end
# # 0.times{|i| p i}

    # res = Yahoo::Api::Shopping.category_ranking({:category_id => "13457"})
    # res.code # 200
    # res.message # "OK"
    # res["ResultSet"]["0"]["Result"].each do |i,v|
    #   next unless i =~ /\d+/
    #   p v["Code"]
    # end
    # res["ResultSet"]["totalResultsReturned"].times do |i|
    #    p res["ResultSet"]["0"]["Result"]["#{i}"]["Code"]
    # end


# res = Yahoo::Api::Shopping.item_search({:category_id => "13457"})
# p res.code # 200
# p res.message # "OK"
# res["ResultSet"]["totalResultsReturned"].times do |i|
#   p res["ResultSet"]["0"]["Result"]["#{i}"]["Code"]
# end

