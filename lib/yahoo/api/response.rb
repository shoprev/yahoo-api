module Yahoo

  class Response

    def initialize(response,format)
      @response =response
      body = @response.body
      if format == "json"
        body = body[9..(body.rindex(")")-1)] if body.include?("callback(")
        @body = JSON.parse(body)
      else
        @body = Hash.from_xml(body)
      end
    end

    def code
      @response.code.to_i
    end

    def message
      @response.message
    end

    def method_missing(name, *args, &block)
      if @body.respond_to?(name)
        @body.send(name, *args, &block)
      else
        super
      end
    end

  end

end
