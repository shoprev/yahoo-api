require File.expand_path(File.dirname(__FILE__) + '/helper')

# Product Search API (version:2010-11-18)
res = Rakuten::Api.get(Rakuten::Api::Product::Search,{:genreId => "101240"})
res["Body"]["ProductSearch"]["Items"]["Item"].each do |v|
  p v["productName"]
end

# Product Detail Search API (version:2011-07-14)
res = Rakuten::Api.get(Rakuten::Api::Product::DetailSearch,{:productId => "182649bd754f31e43123378ea108411a"})
res["Body"]["ProductDetail"]["Item"].each do |v|
  p v["productNo"]
end

# Product Genre Search API (version:2010-11-18)
res = Rakuten::Api.get(Rakuten::Api::Product::GenreSearch,{:genreId => "101240"})
res["Body"]["ProductGenreInfo"]["GenreInformation"]["child"].each do |v|
  p v["genreName"]
end
