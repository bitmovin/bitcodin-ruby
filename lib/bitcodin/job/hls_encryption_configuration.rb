module Bitcodin
  class HLSEncryptionConfiguration
    attr_accessor :values
    def initialize(method, key, iv)
      @values = '{
        "method": "' + method + '",
        "key": "' + key + '",
        "iv": "' + iv + '"
      }'
    end
  end
end
