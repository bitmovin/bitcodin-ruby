module Bitcodin
  class HTTPInputConfig

    attr_accessor :values

    def initialize(url, username = nil, password = nil)
      if username.nil?
        @values = '{
          "url": "' + url + '"
         }'
      else
        @values = '{
          "url": "'      + url + '",
          "username": "' + username + '",
          "password": "' + password + '"
        }'
      end

    end

  end
end
