module Bitcodin
  class DrmConfiguration

    attr_accessor :values

    def initialize(system, provider, signing_key, signing_iv, request_url, content_id, method)
      @values = '{
        "system": "'      + system + '",
        "provider": "' + provider + '",
        "signingKey": "' + signing_key + '",
        "signingIV": "' + signing_iv + '",
        "requestUrl": "' + request_url + '",
        "contentId": "' + content_id + '",
        "method": "' + method + '"
      }'
    end

  end
end
