module Bitcodin

  class WidevineDrmConfiguration
    attr_accessor :values
    def initialize(provider, signing_key, signing_iv, request_url, content_id, method)
      @values = '{
        "system": "'      + "widevine" + '",
        "provider": "' + provider + '",
        "signingKey": "' + signing_key + '",
        "signingIV": "' + signing_iv + '",
        "requestUrl": "' + request_url + '",
        "contentId": "' + content_id + '",
        "method": "' + method + '"
      }'
    end
  end

  class PlayreadyDrmConfiguration
    attr_accessor :values
    def initialize(key_seed, la_url, method, kid)
      @values = '{
        "system": "'      + "playready" + '",
        "keySeed": "' + key_seed + '",
        "laUrl": "' + la_url + '",
        "method": "' + method + '",
        "kid": "' + kid + '"
      }'
    end
  end

  class WidevinePlayreadyCombinedDrmConfiguration
    attr_accessor :values
    def initialize(kid, key, la_url, method, pssh)
      @values = '{
        "system": "'      + "widevine_playready" + '",
        "kid": "' + kid + '",
        "key": "' + key + '",
        "laUrl": "' + la_url + '",
        "method": "' + method + '",
        "pssh": "' + pssh + '"
      }'
    end
  end

end
