module Bitcodin
  class VideoMetaDataConfiguration
    attr_accessor :values
    def initialize(default_stream_id, language, label)
      @values = '{
        "defaultStreamId": ' + default_stream_id.to_s + ',
        "language": "' + language + '",
        "label": "' + label + '"
      }'
    end
  end
end