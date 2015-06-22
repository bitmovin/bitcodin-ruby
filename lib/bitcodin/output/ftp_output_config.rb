module Bitcodin
  class FTPOutputConfig

    attr_accessor :TYPE, :values

    def initialize(name, host, username, password, passive = 'true')
      @TYPE   = 'ftp'

      @values = '{
        "type": "'     + @TYPE + '",
        "name": "'     + name + '",
        "host": "'     + host + '",
        "username": "' + username + '",
        "password": "' + password + '",
        "passive":  '  + passive + '
      }'
    end

  end
end
