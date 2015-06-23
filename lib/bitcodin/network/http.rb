module Bitcodin
  class HTTP

    attr_accessor :apiKey, :headers

    def initialize(apiKey, headers)
      @apiKey  = apiKey
      @headers = headers
    end

    def sendRequest(method, url, values = nil)
      case method
        when 'get'
          callResourceGet(url)
        when 'patch'
          callResourcePatch(url)
        when 'post'
          callResourcePost(url, values)
        when 'delete'
          callResourceDelete(url)
      end
    end

    def callResourceGet(url)
      # puts 'Get'
      # puts url
      begin
        response = RestClient.get url, @headers
        return response
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
        return nil
      end
    end

    def callResourcePatch(url)
      # puts 'Patch'
      # puts url
      begin
        response = RestClient.patch url, @headers
        return response
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
        return nil
      end
    end

    def callResourcePost(url, value)
      # puts 'Post'
      # puts url
      # puts value
      begin
        response = RestClient.post url, value, @headers
        return response
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
        return nil
      end
    end

    def callResourceDelete(url)
      # puts 'Delete'
      # puts url
      begin
        response = RestClient.delete url, @headers
        return response
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
        return nil
      end
    end


  end
end
