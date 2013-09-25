require "yahoo/api"
res = Yahoo::Api::Shopping.item_search({:category_id => 13457})
p res.code # 200
p res.message # "OK"
#res["ResultSet"]["totalResultsReturned"].times 
