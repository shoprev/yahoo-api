module Yahoo

  class Request

    def self.get(path,opts)
      uri = URI.parse("#{path}?#{opts.map {|k,v|"#{k}=#{URI.encode(v)}"}.join('&')}")
      Response.new(Net::HTTP.get_response(uri))
    end

  end

end
